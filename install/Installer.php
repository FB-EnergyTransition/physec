<?php
namespace booosta\installer;

require_once __DIR__ . '/../vendor/autoload.php';

use Composer\Script\Event;
use Composer\Installer\PackageEvent;
use booosta\Framework as b;
b::croot();
b::load();

class Installer
{
  protected static function readline($prompt = null)
  {
    if($prompt) echo $prompt;
    $fp = fopen("php://stdin","r");
    $line = rtrim(fgets($fp, 1024));
    return $line;
  }

  public static function letsgo(Event $e)
  {
    print "Installer started.\n";

    if(is_readable('.installervars')):
      $installervars = json_decode(file_get_contents('.installervars'), true);
      extract($installervars);
    endif;

    if($db_hostname == '') $db_hostname = 'localhost';

    $var['sitename'] = self::readline("Website name: [$sitename] ") ?: $sitename;
    $var['db_hostname'] = self::readline("DB hostname [$db_hostname]: ") ?: $db_hostname;
    $var['db_name'] = self::readline("DB name: [$db_name] ") ?: $db_name;
    $var['db_user'] = self::readline("DB user: [$db_user] ") ?: $db_user;
    $var['db_password'] = self::readline("DB_password: [$db_password] ") ?: $db_password;
    $var['password'] = self::readline("admin password: [$password] ") ?: $password;

    $json = json_encode($var);
    file_put_contents('.installervars', $json);

    file_put_contents('local/key.php', '<?php $this->key = "' . base64_encode(openssl_random_pseudo_bytes(32)) . '"; ?>');    

    $tpl = file_get_contents('local/config.incl.dist.php');
    $code = str_replace('{confirm_registration}', !empty($var['registrationconfirmation']) ? 'true' : 'false', $tpl);
    $code = str_replace('{allow_registration}', !empty($var['userregistration']) ? 'true' : 'false', $code);
    $code = str_replace('{sitename}', $var['sitename'], $code);
    $code = str_replace('{sitename_short}', substr($var['sitename'], 0, 3), $code);
    $code = str_replace('{mail_sender}', $var['email'] ?? 'my@email.com', $code);
    $code = str_replace('{db_module}', $var['database'] ?? 'mysqli', $code);
    $code = str_replace('{db_hostname}', $var['db_hostname'], $code);
    $code = str_replace('{db_database}', $var['db_name'], $code);
    $code = str_replace('{db_user}', $var['db_user'], $code);
    $code = str_replace('{db_password}', $var['db_password'], $code);
    $code = str_replace('{language}', $var['language'] ?? 'en', $code);
    $code = str_replace('{mail_backend}', $var['mail_module'] ?? 'php', $code);
    $code = str_replace('{smtp_host}', $var['smtp_host'] ?? '', $code);
    $code = str_replace('{smtp_username}', $var['smtp_username'] ?? '', $code);
    $code = str_replace('{smtp_password}', $var['smtp_password'] ?? '', $code);

    file_put_contents('local/config.incl.php', $code);

    copy('install/htaccess.dist', '.htaccess');
    unlink('tpl/dummy');
    unlink('upload/dummy');
    unlink('incl/dummy');

    // next part must not be run in static function to have $this->DB available
    $worker = new Worker($var);
    $worker();
  }
}


class Worker extends \booosta\base\Base
{
  public function __construct(protected $var) 
  {
    parent::__construct();
  }

  public function __invoke()
  {
    include 'local/config.incl.php';

    $sql = file_get_contents('install/mysql.sql');
    if(!$this->DB->query_value("show tables like 'adminuser'")) $this->DB->multi_query($sql);
    if($error = $this->DB->get_error()) print 'setting up DB: ' . $error;

    $crypterclass = $this->config('crypter_class') ?? 'aes256';
    $crypter = $this->makeInstance($crypterclass);
    $pwd = $crypter->encrypt($this->var['password']);
    #\booosta\debug("password: {$var['password']}"); \booosta\debug("enc: $pwd");
    $this->DB->query("update adminuser set password='$pwd' where username='admin'");
    $this->DB->query("commit");

    print "\nInstaller has finished now. Check if everything looks fine and then delete the install directory and the file .installervars\n\n";
  }
}

