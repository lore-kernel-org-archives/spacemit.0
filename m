Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FF631CA4E
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212543; cv=none; b=cbR/SkX6yF2dufjejkTSjBcdSuO+1QbJVZogvw8lkg8RxkQ26XuSDxHCzf2JjOzj+1aYx/jqNSrGc9JzhyebAfvEE8sMUaGfJjEgn92FqdW/YNi5rhT85GVx1JS6LgphLezK7hmpuVqd9IZR1Ur4YC/1yF3CUi2oKCeVpGXU4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212543; c=relaxed/simple;
	bh=+crtDq0mXabYH2Lz3fi9Mlu1oIxDcHVi/vLFzRBDDfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPeKIRimAPXiqZ2KzLfAdW8+osu1IB92xJbc0qbCH3SLevSWiN1ZZY/jGOiJM2d7Ab8Vw0CQcctAYlvpci6FaD99BNuoezhjA16zL8D5MYC+aJLjZPWt2bgk2EA26AG+V/A/0X+T6bjtl2cT784qWVgbl7QWHsa+mpeL8jGtpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mw0wrNBX; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mw0wrNBX"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-4242bb22132so9951835ab.3
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758212541; x=1758817341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AU2OV7gY++1HQBPAJUTGEHGKnym698Yje6WiyRPMWQ8=;
        b=mw0wrNBXQMP2hZo3Hy3d6yll3rVMrduIY8TfhY4aLhhX/kyD8m6ipIVMagTD7SsqVX
         Uv3jolq0rzmzUSJpQFJu8iHWHEY1oPgxVPwWDC9GzTYrp6+xOtgmFq1oDDghaf0j1JQb
         oWMAvWpx52AgxI0Q4nqozldumZSShJ65hQv4OC8AyoRKTEjmT4JuTfvEmvJPuXWBWAiW
         cyWsk1zFgXybCAyXQI2SSYa6Slk5cmd4gjL+uqReoowDUPqjFuPTeoNQImCl4rSlcOsn
         9KU94FmaKJaTgSbpYUbw1XOp9HyXiGlLp37tKgn2VxOywGDq/ZmrdU0DqRz0xRUAunrW
         DUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212541; x=1758817341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AU2OV7gY++1HQBPAJUTGEHGKnym698Yje6WiyRPMWQ8=;
        b=UFMIeR4lfa/m111wNwU0vwoufH46ZZEuyd2H7toRBn4a/NIReIVaoGignMDPc3cZvD
         ciNAy7ifOOAW/izi/iHoJDlKc8GiFw0NPE2Ec7S3NLFhBouX3rSURzXOp3VXxYgIOgEy
         LrtC1KeeaTf9PF+P7C4jFZt1FlrphDP+434iX5KazdMrPLmGu8N2Ut96ODinQX0Dyfqe
         ZGr+dVaHweWpxeAVzoMP5OVA8Az2qThHTJkssFR7adG1Q19n2aj+d18M92mhhFpFB/yV
         TfjicQ4KcOCCwCDcvOz1x82laDS3elJk8m62Hie10IOrJdy5vd9XdI+cRp3Ejkmfh09K
         pKqA==
X-Forwarded-Encrypted: i=1; AJvYcCUoDDkSMaVceOKR/AgWFDfY315d2ycAxxN7ducR8cfUoLTOw/iWuhSWO9iGZF+13N0RA46ap2KLWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL0DENNniYd7VNmBJO9+uutWw+A2pnLENrpVNisagzVtQyh0E/
	1JM2VIoiVV5VXI2cGOStW33LtVOaIAqsh4My/bHzebOvQ3nw6xqMN3/Js/6ae/yyxkI=
X-Gm-Gg: ASbGncumYADHOol7FmQH/6feqrzNB8Jo8kFoqMoD/YPmxM13QXj8DUoF5qZ0lUnDkn6
	CPLy4BhFFqTJWnnWMDUiZrqRH+vvslPkCjafjkeUdURx9ia6JhPhygp78EG1FJPtaO3hVpFokp/
	UI3XpkIuiJO1ChDTkFh6YGqDpYMrR+xJ+xODNJGJcl0u054wLBZ8XfTaSl8VIZnSR7g0KEiBSqD
	EM14ne2CjcV9CfammfIRNi6rBe0mJ1dCNbCtyVoKGYRQDwGyO6RPThntRPhY0TuQr6Xo9jxWIil
	xMZOXPJZ7SAinx8wtOzztUXwVcWOvRdiHU+Gx5Q+l8K0CU1hzO3vc5hMm7R+Ywz/s1in4dFlCT8
	DXyV0faPZrtXXWV2TO3a/mbc6wT8Vq94ZgQPQPsKQHBq4Q+Ezfzq3KTfBu9KzcqQbTjIs+doGRb
	bgDW5u6g==
X-Google-Smtp-Source: AGHT+IEJA379jBFlrQdMuZZ7GAQYUyd69Hmjw5o+yqSb0aHO7CoUDX+AkO4upDsCoz0J8wxrQujxtw==
X-Received: by 2002:a05:6e02:1b05:b0:418:aefa:bb83 with SMTP id e9e14a558f8ab-4248190b442mr2732905ab.5.1758212541014;
        Thu, 18 Sep 2025 09:22:21 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e3373f6sm1110059173.29.2025.09.18.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:22:20 -0700 (PDT)
Message-ID: <5a8364e4-3160-4459-9db4-c9d877ba8c6e@riscstar.com>
Date: Thu, 18 Sep 2025 11:22:19 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	ret = of_property_read_u32(np, "spi-max-frequency", &host->max_speed_hz);
>>>> +	if (ret < 0) {
>>>> +		if (ret != -EINVAL)
>>>> +			dev_warn(dev, "bad spi-max-frequency, using %u\n",
>>>> +				 K1_SPI_MAX_SPEED_HZ);
>>> the err msg does't really usefull..
>> You mean there should be no error message, or that it
>> should say something else?
>>
>>>> +		host->max_speed_hz = K1_SPI_MAX_SPEED_HZ;
>>>> +	}
>>> so in any case, there will be an assignment, I'd rather simplify it as
>>>
>>> 	if (of_property_read_u32(np, "spi-max-frequency", &host->max_speed_hz);
>>> 		host->max_speed_hz = K1_SPI_MAX_SPEED_HZ;
>> I add the warning so it's clear we're using something different
>> than is specified in the DT.
>>
> I personally do not really care about the msg as long as there is a known good value,
> but you could weigh this..
> 
> further I feel the warning message isn't accurate, if spi-max-frequency is
> "bad", why not let user fix it? does "bad" means invalid or overflow?

The reality is that this is a property in the DTB, so it can't
be "fixed" by the user.  It defines the *maximum* frequency
that this particular controller (on this board, or possibly
limited by what the SoC is capable of) will implement.

Stating that it's "bad" seems enough, given it normally can't
be changed--and we will use a sane default instead.

It might helpful to indicate what the bad value is, but that
complicates the code ("bad" could mean the property was
specified without a value too).

> I don't want to have bikeshedding on this, feel free to pick my suggestion
> or keep yours, there is no much real difference

I plan to keep the code as-is.

I don't actually know whether the limitation is on the SoC
or the board (or even whether it truly is the upper bound).
I'll ask SpacemiT about that.

The default value is expected to work on all platforms.  If
If it's specified at all, it should be done in the board
file (so it won't be in "k1.dtsi").

If I don't learn of specific constraints, I'll omit it in
the DTS file (it's currently unused).

However I *will* add some new code that verifies that the
value (if specified) is within the SoC-supported range,
which is 6.25 Kbps-51.2Mbps.

> thanks for your efforts to work on this

And thank you for your review feedback.

					-Alex>
> -- Yixun Lan (dlan)

