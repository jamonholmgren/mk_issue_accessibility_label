class MKLayout < MK::Layout
  def layout
    root UIView, :main
  end

  def main_style
    # Broken
    accessibility_label "Hi!"
    # Works
    target.accessibilityLabel = "Hi!"
  end
end

class MKVC < UIViewController
  def loadView
    @layout = MKLayout.new
    self.view = @layout.view
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    MKVC.new.view # triggers the load
    true
  end
end
