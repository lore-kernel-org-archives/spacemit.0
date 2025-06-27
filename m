Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91492C3745
	for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031404; cv=none; b=QOwavkm1x1Vy1+WsGgKmn6KLgAoMhwa4d1fuy8vnUSNsgtot8VGOicGzo9d+g6djQmNLbL15TVuykOqTuLIZOdpTKRiDb0xnegkxzDlzI8BXX7Z/P+gqpGfY+PXqN3fVbBY+XZFFtPK7W6AOj6zZHalIn+NoQEZg/m+BrJdDucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031404; c=relaxed/simple;
	bh=fk+HBAiRPVdgGsHsF5qNIsiflq+XoguW2NtWdyg8cgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNQkD9rF4GPEynWGJtnU8xOVdQ1KDYpTQurBuvyjTJ8ptim9MVW7moN/5sqz3rPwILm0LIefvYvDv5Z2HF95IHZ2fKBnLQx5+m+J95KQfRco1Cz3bBIL0vTY0KxJZpxKRctvJ1WWJXjKNdxsRsJ00Fi8OuWQClNSMUM9tQQzU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yLYgXPbo; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yLYgXPbo"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-875acfc133dso64681039f.1
        for <spacemit@lists.linux.dev>; Fri, 27 Jun 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751031402; x=1751636202; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=yLYgXPboL/PHUD2r6Fqgabjx4puoEWVySKrwkWDRyxMp7AsfVPlK5jr3JcLgwVeET6
         7AfXsQoFEFyxkGLkqiyAQNo9ymwluD/lh+elc1SC6pR9Az4VjqbPpgl292PCmTSNeASi
         ob2c0fMLh9ZWUD2aks+/LyGzhntXJmy3DcQOHCcn6BSLKNbzxRV1UQO36R4JIw5GqiiQ
         sf9VYOg9+j0IgWfignD/bIajcO56G/XV2ZBFgTRc8VASmB3xOfNHAa+oUbDsb3Wn+m2Y
         eRb8F6Yq8jiLhiZBF0drX0kumdbferB8oa0/XAl3RdvY3usC88Ti71b07pLNS5o0/cZc
         W9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031402; x=1751636202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=KUdN+GaV+1+YGZYgBLunjDUxs699vZMoA1aubHH+fYI1Pk5vGd6m4UQQXi0+UdBXGt
         zZvf+f0kzV6Tn/wqJkG9ePLYMyH4JvoqSAcFIz74BYfPsMbligXkSs51HUaHCQQuifMM
         ZqtQ0nh7/ngzQsEU8K5tEcUH/u5oEegEMMQmFZuWQddsfvsAVV3s3mL64f+99kPcLzUa
         SHrlUf81GZrpaLVcwVKVHPQe2e0oImk6GpYuizYODHfx27oqfrr2uO6YMzFJLZJC/ohI
         eP86ybjthd4CMly9IGAsIffBMuLC2FOQjqoToG8dZQaGspEEC6L8J3opVCcZg4sdcKMn
         pryg==
X-Forwarded-Encrypted: i=1; AJvYcCUSFSewLH9egkSUxYFlYrbprPhfRrsXWNeesH+N9+UvC2hn9U1aiXG892rKwwqIDE3o0KrdCk9xSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1+6i0h5jlf/tg4P86DIpEob94wNinK0byneWzAaIWXN16rb+1
	Hl43j8/VTDGbTJb6O3i/nni4GmHRgqQXZlokRXr2P84Y7v+5HXmh1tpznyr7YurDiu4=
X-Gm-Gg: ASbGnct9G5xFTwcMf5lAQA3q0TBojp2S5gQNhBuvqdM9hWKEhnGsNxZdjCRrTcn8tf7
	QE2flPwcUNsr8LOO6wtJd71xZjU945M7BnjPhrs5fgy3BDD6IAU5jfZC6e1A6rKxbdX4yDGVAgP
	KkQHdpQP3lMjQ9douSmPfMNRkxXHFU1ZneAS9I/mWfVJE8HufFiuSFEs232Mk6MmxT0raA8kWPe
	9Wg+Ax0x04Twzz5elp6PVqyRiOJEPeQ3dJGJ0fHp5AOJwLLHDObUw8uUzX5QEIGSV6A7mKP1i4Z
	ckEOtKxqN16ExIjh6b1SPcTdyatQ7LCwvjuJqVZqMA+GCpeRhbWBMLqpQ0nqv3BeTKdDRQ3ktZL
	PowYkxdGLBWtUaZzcymmBxWBWfw==
X-Google-Smtp-Source: AGHT+IF1O8tzv2KWCzSl21OTyig59TTY0gf7CGovzXL+B16wQcpv5kKezeVDaVnpkiTgGZ9wCICGDQ==
X-Received: by 2002:a05:6602:2dcc:b0:873:3691:6fb8 with SMTP id ca18e2360f4ac-876882cb88dmr404639839f.8.1751031401882;
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876879f3584sm46791339f.9.2025.06.27.06.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Message-ID: <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
Date: Fri, 27 Jun 2025 08:36:39 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
 <20250627125119.GF10134@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250627125119.GF10134@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/25 7:51 AM, Lee Jones wrote:
>> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>>   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>>   };
>>   
>> +static const struct regmap_config spacemit_p1_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = 0xaa,
>> +};
> Suggest making this more widely useful by adding the 'max_register'
> attribute to 'struct simple_mfd' and conditionally overriding
> regmap_config_8r_8v's value during probe.

So you're suggesting I make a general improvement to
"simple-mfd-i2c.c", because everybody else just uses
the generic fallback regmap config?

(I'm asking because at first I didn't understand your
statement, and the "more widely useful" comment).

I would be happy to do this, and it's not that hard.
Can I do it as a follow-on patch though?  It's adding
scope (again), beyond what I anticipated and honestly
I'm ready to be done with this...

Anyway, if you say "no" I'll send another version of
this series today.

					-Alex


> 
>> +static const struct mfd_cell spacemit_p1_cells[] = {
>> +	{ .name = "spacemit-p1-regulator", },
>> +	{ .name = "spacemit-p1-rtc", },
>> +};
>> +

