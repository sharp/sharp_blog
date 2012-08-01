String.class_eval do
  def to_pinyin
    Hz2py.do(self)
  end
end
