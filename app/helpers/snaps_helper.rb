module SnapsHelper
  def liked_snap(snap)
    current_user.voted_for?(snap) ? "heart" : "heart-empty"
  end
end
