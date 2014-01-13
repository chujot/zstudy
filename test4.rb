require 'sinatra'

get '/test' do

    if params['c'] == 'd'
        result = params['a'].to_i + params['b'].to_i
      elsif params['c'] == 'e'
        result = params['a'].to_i - params['b'].to_i
      elsif params['c'] == 'f'
        result = params['a'].to_i / params['b'].to_i
      elsif params['c'] == 'g'
        result = params['a'].to_i * params['b'].to_i
    end

    if result == nil
      answer = "数値を入れて計算してみよう"
    else
      answer = "答えは#{result}だよ(・∀・)"
    end


  %Q{
    <form>
      <input name="a" value='#{params['a']}'>

      <select name="c">
        <option value="d"> ＋ </option>
        <option value="e"> − </option>
        <option value="f"> ÷</option>
        <option value="g"> × </option>
      </select>

      <input name="b" value='#{params['b']}'>

      =

      <input value="#{result}" readonly>

      <input type="reset" value="クリア">
      <input type="submit" value="送信">
    </form>

    #{answer}


  }
end
