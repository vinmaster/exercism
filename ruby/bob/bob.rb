class Bob
  def hey remark
    builder = ResponseBuilder.new(remark)
    response = builder.build
    response.to_s
  end
end

class ResponseBuilder
  def initialize remark
    @remark = remark
  end

  def build
    case
    when Silent.is_type?(@remark)
      Silent.new
    when Yelling.is_type?(@remark)
      Yelling.new
    when Question.is_type?(@remark)
      Question.new
    else
      Other.new
    end
  end
end

class Response
  def type
    self.class.name
  end
  def self.is_type? remark; raise end
  def to_s; raise; end
end

class Silent < Response
  def self.is_type? remark
    remark.strip.length == 0
  end
  def to_s
    "Fine. Be that way!"
  end
end

class Yelling < Response
  def self.is_type? remark
    remark =~ /[a-zA-z]/ && remark.upcase == remark
  end
  def to_s
    "Whoa, chill out!"
  end
end

class Question < Response
  def self.is_type? remark
    remark[-1] == "?"
  end
  def to_s
    "Sure."
  end
end

class Other < Response
  def to_s
    "Whatever."
  end
end
