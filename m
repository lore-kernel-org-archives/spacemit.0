Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73934B1A0
	for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161365; cv=none; b=H7Ja2tQ14t+vSjJy54nAr5WeZA4adI+O3Y2whqeWk7PHd2NJG2P51TVs1HPcsjpnNTcFFbjIWs7FpEnWFUJXHGyeoXE3+9flb3HpHDRdgPzA57SYVn9rFQCjuNZBMcj+gD3lEHGSt/Dpl5S7x9336JxgmCBUxSRstQKnda6NZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161365; c=relaxed/simple;
	bh=ZrfWh/ijxCDqCCWp/uJ7Kl1B1mKM00e4Rup8caSKxRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rezySpM9UO23md4wOfw/4fLt1ROiPTZ9kXvaZCukr3A6qo+ZMPbnfswe+uLMJMi4mSyAjQDKGIKpgIsAXAhT3n/cbEa+K2BK7vxBbZoKsEYEsk+zTfSZhWYXWsxeufxqpmlySPbAxeFHHWhw11TJgCAjvWKSvQNbMpwvE64C1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tdXpZ1fZ; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tdXpZ1fZ"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bb6a27d3edso610237485a.3
        for <spacemit@lists.linux.dev>; Sun, 11 Jan 2026 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768161362; x=1768766162; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=tdXpZ1fZ8sW2Wrs6j4uvh9a6BSYpXa8fbwJ/TOPjkhVsFcwNUyy/LqutEpUOuoPKdQ
         i94mXic8ezGQyxwPTz1nal8DM/Nj+ZAEtZBSkPL21SFyx2FYp9epHoDtuw1o85C2pITt
         96A11dX9N4UVEk+DiRRlIag2k0h/yNETnhTrz7w8Y1iv49WYMvNnuhOUQRpZ29/v5Mhe
         8XWd5fw7OBydbT/Oh+S/vrE543ODgY8oAPb5MJH4pGb03GxGoGLmAfjA7j31/uX7IXR5
         LRtqC9Ba0eipjHO1fzKOymW6XHxvuvdGa0qOqM88RFrRMozG1aEqrJbuiKW7Ms4aaixE
         /1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161362; x=1768766162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOUBhbeaXMEYonUlyi3dh9viIlCbuv3hV4saX11FjGc=;
        b=hPqSb+g9CYTiuPpSCl4QGmIwUxXj66oK6u4HFw0TRpotazsbqI0LhCHsAnJqm5SOxf
         ViojRQ0R8n7cTr4iKb2h9tlSub4fPiU7KhWx2p1qwjYr1ZMTnilbR+dHHSigTyiMKNss
         CrM/ydrsfkyPxJ65ecBwMrP2lu20rRVip9AcnmBed3QOWsHz3yuocBGJbGk/5090tEFC
         9MRJqZ8vFhtFr091Z/PycQGNZ/YF3n4tLhjkG67jotMY18DmjSf7L2lP07ihsABx0KzS
         s5Xx+QQKoAjLl+ao3UIkruJKpyfz5+NGBvy/sAghXBe3ThI/p4Zv4mzkmr1uSfxGuE7h
         xcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtL9DjjR3a7r/Ja0gHkScx88Wff5s7hqG801KywVJ9KvHnXtlj6gjS4ocMZ4h6bu1o+UbYKEqdUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWZrCBJrNV2Wx3N3PDqFWhrEthCCec14P4ZzxZkPYnd3b8pZRB
	YptSrh4SyeUPcxGbdGRjTR1wy6HlPSN6BjmfZf3UKEvzrlh2OrYajCotiQ5sZapqHcY=
X-Gm-Gg: AY/fxX5UfAkItOqYNIwiBQ0/sZqu62SuRr22tRvssaMxqrsPXpi7WArrIPbkeYqIk2A
	fkWQgU8OYFI70VLt2xYoAk8hexlzo421yNaHRMJcchx8U6N3/AFJKu9GPLMmVcZpIpg20qCAyPN
	u9eZrOH7fcY6fTpmexdCH3O9ox+uS4o5C8MIoFW8+AcogeCRgE1FMh8Kn8jC4dDkMPiHL+ryUbu
	ZrtHuptRmR1Pwcbn9lxIT9jUrNPAuT5hIIb1mvYWazucMPDJ9QWTfAIEpMNvF8mywoNv/FD4gSS
	j4g7CQnFZYhIVcw1g5r4rhT1LXWpeSPU58OWL1llNmBZT2OytqPmT7jCcN6CFaAWunHhxTgo+rK
	n3qpXc3RunzRbjI3M2lrGxUk6ItJbXBp8yaUA5ajNDJzO/6xiLpqS8H5hxmkYstPFTjGMUSb5Ke
	iFZHeqHgprMzju9D0Du/qG4LDCBog4Vh92SAIqCG8qklMXssNXO0QjThGT4pumOtAA
X-Google-Smtp-Source: AGHT+IE59tdTZ/GflUoGe/9DlksdMPcDRktcTk1R3UIHBonEpxYes8KI9f6r/aWCmNZietl2oAn6tQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2288627285a.51.1768161362565;
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b90c3sm1395290085a.19.2026.01.11.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:56:02 -0800 (PST)
Message-ID: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
Date: Sun, 11 Jan 2026 13:55:59 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260109223627b566d2b0@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>> The purpose is to make the driver a module (not built-in)
>> when "defconfig" is used (without the need for any Kconfig
>> fragments to unselect things).
>>
>>
>> In arch/riscv/configs/defconfig, we have this:
>>      CONFIG_ARCH_SPACEMIT=y
>>
>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>> (added by patch 2 in this series):
>>      config MFD_SPACEMIT_P1
>> 	default m if ARCH_SPACEMIT
>>
>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>> to benefit non-SpacemiT RISC-V platforms.
>>
>> This patch is trying to do the same thing for the RTC,
>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>> by default.
>>
>> I think you understand.
> I'm sorry, I must be dumb but I don't understand. The current behaviour

I think I'm the dumb one.  I think I finally understand your
point.

> is that when MFD_SPACEMIT_P1 is m, then the default value for
> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
> the default of RTC_DRV_SPACEMIT_P1.

Your point is that patch has no real effect, at least not
on the scenario I was talking about.

I.e., I was saying this mattered for using defconfig alone.
But, as you point out, using defconfig alone gives us:

   ARCH_SPACMIT=y	(in defconfig)
   MFD_SPACEMIT_P1=m	(from patch 2)

And then, *without* this patch:
   RTC_DRV_SPACEMIT_P1=MFD_SPACEMIT_P1
meaning
   RTC_DRV_SPACEMIT_P1=m

And therefore there's no need for this patch to set the
default to m rather than MFD_SPACEMIT_P1.


> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
> correct one and the proper fix is then patch 2.

Yes, now I understand.  I'm sorry about my confusion.

					-Alex
