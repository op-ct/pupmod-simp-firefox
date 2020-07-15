# Install and configure firefox
#
# @param package_ensure
#    Value for the package ensure option for packages installed by this
#    module
#
# @param install_cacerts
#    If set to true the CA certs defined by cacerts value will be installed
#    in the certificate store for firefox.
#
# @param cacerts
#    The location of the ca certs, without headers, to be loaded into
#    the certificate store. If left undefined  the value of
#    pki::cacert_no_hdrs_file will be used.
#
# @param certstore
#    The location of the firefox certificate store directory.  This is
#    set in data in modules.
#
# @author https://github.com/simp/pupmod-simp-firefox/graphs/contributors
#
class firefox(
  String                          $package_ensure = simplib::lookup('simp_options::package_ensure', { 'default_value' => 'installed' }),
  Boolean                         $install_cacerts    = false,
  Optional[Stdlib::Absolutepath]  $cacerts          = undef,   #data in modules
  Stdlib::Absolutepath            $certstore,   #data in modules
){
  simplib::assert_metadata($module_name)

  include 'firefox::install'
  include 'firefox::config'

  Class['firefox::install'] -> Class['firefox::config']

}
