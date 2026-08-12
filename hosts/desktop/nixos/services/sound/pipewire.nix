let
  name = {
    speakers = "Speakers";
    headphones = "Headphones";
  };
in
{
  services.pipewire.wireplumber.extraConfig = {
    "99-disable-suspend"."monitor.alsa.rules" = [
      {
        matches = [
          { "node.name" = "~alsa_input.*"; }
          { "node.name" = "~alsa_output.*"; }
        ];
        actions.update-props."session.suspend-timeout-seconds" = 0;
      }
    ];

    "98-${name.speakers}-rename"."monitor.alsa.rules" = [
      {
        matches = [
          { "device.name" = "alsa_card.pci-0000_00_1f.3"; }
          { "node.name" = "alsa_output.pci-0000_00_1f.3.analog-stereo"; }
          { "node.name" = "alsa_input.pci-0000_00_1f.3.analog-stereo"; }
        ];
        actions.update-props = {
          "device.description" = "${name.speakers}";

          "node.description" = "${name.speakers}";
          "node.nick" = "${name.speakers}";
        };
      }
    ];

    "97-${name.headphones}-rename"."monitor.alsa.rules" = [
      {
        matches = [
          { "device.name" = "alsa_card.pci-0000_01_00.1"; }
          { "node.name" = "alsa_output.pci-0000_01_00.1.hdmi-stereo-extra4"; }
        ];
        actions.update-props = {
          "device.description" = "${name.headphones}";

          "node.description" = "${name.headphones}";
          "node.nick" = "${name.headphones}";
        };
      }
    ];
  };
}
