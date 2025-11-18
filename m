Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D8733C1B2
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487173; cv=none; b=O0m+6tfz+Tx60Xx4qFHa6ToyC7xwp/U6I1eUXgFoKUKwVQRhaDP1r+ahUchfT8OqyBiRtoKtYK20vWytin/KixDfBwRb+fYxIZLQnJRWYXKv6cWOrnX15Ux9m7nrBsnDt7xKuBZSGnifHpAZ87imOGa/bREXDVmwcO/DsETIKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487173; c=relaxed/simple;
	bh=xsbCHfdfJS3GyOiFBe9tPYn5s7T1RShrdeMH8RFRZu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdxbN+B/YWlqAF9Bv36YSd/Db6CkJSuI5PRslo1LrVWjb16au+vvbYlQdmvq4VFMOE0wP/qyO8bFYUoMUdu5MoTi+T+MBTOGOmBVtCSc6pJvAgLmSGoEGMw6AVEmmeufw572tf/wljJ0BSkj6r8hgKMJulO01Fft9oscDIHCFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MP+POwoP; arc=none smtp.client-ip=209.85.166.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MP+POwoP"
Received: by mail-il1-f196.google.com with SMTP id e9e14a558f8ab-43326c74911so32252335ab.2
        for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487170; x=1764091970; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=MP+POwoPI2DVWT0l1JIpIJw+5IEbGXn5rkUUn0pFJ6N5LQb4KZWfnY9GhiO5YiAzoD
         rcpqsLKR7GFpgRntMivZuU6AXXSce6erUQ/+7tCH9H/NzZlqW46S6WW0Q+Ldm+Uhx4jB
         Wkx3QpySGxP8HDSPvMTVnEsLB8T1u2RdioBCxcK0TKVR/Q58kzOti4A/DvuDkZcKSoPJ
         6MbxP7E21Hm9FLIWS5hqqKes9iwf20IIiS3Rxu341DJ75aAOpWVbgW8SjrvcuoJLj5Bi
         hgNoCtfkgyg5Rm+IFPx87Z2KutR1iCCzJrZwORGAo263qYj+XfUg7Oyr8iZEQuiJdelR
         TVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487170; x=1764091970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=BQ0CerpBE/7BckiFzvMjXg2JxCQJ1scdlw3jvFQFlav0TqZa6+MnQOnsNMJjIbm+q0
         aiojyNNANqZ+LxbCmAs3cym76Pzna+DY3WzxZpVVjcAfDxoD0aLWDiKuRT2R9NfCXim5
         3rHWT7FBHbz1Gnogreg60l/7lvHsRpO95kkVvyWcwd+gLnNShIwc8p2qHkdEVHrC70kB
         qo0ukeMn14qHLKZotLhP3y+0keiWsF0lzvvTTBVkU5EF3/gReIEoMNKTT2DSGjYDNiid
         GD7240NYpWcx7roVRY09wXZYC13NpNv0JQzEvCOYvxeimVOFGXLv+ELAQcc3CzeFUnLm
         E8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUwXsFOrXyaQ2fcWekO9sReVE1ToAeZRqYmAmmU8pK3tFhM72wwREl/2eZTdJnlJjWqcO5qdHgRtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQwmpBe6QF6p1vJ7iUVVo24oWRlgywoWtpzhHlSxV8h/yoVaet
	QC2lHfsdzQsuWAnjCf4nvN7U8Kq+QbXhr+OK5Sn75LcGdjQFVNaK91N/BZJNVEjlXS4=
X-Gm-Gg: ASbGncvZlSy7icxgM+H81Vpc7Re9drX+kokrtbhaUxkmINmQDW+lBDuirE2m/HfbrkQ
	SS0GzFwowTEc8lJF27e1/9s2ptparNNz0vz7zWO7zGOB6PKcfIcdo1CQ7oxQyg7bl6dn06Ql0+s
	2KtVDPz/GdkvYAqmQLIDx956Qym39B9vnWumVLPM1aAPjVuhFrTMrIpcdigf9Wlc1tZkpKc3cjO
	JevPcXh/avivRP0tqdp14zk72yp4D/X+70vfDyzJ2yurtqXpG8ogUxhle8SBTR1LZp5NNT9DcmX
	x86IVLhabNbCNaG0jVuRB6uJq1V+9mMZ8zl6/9MNx07t5ehb395mq0zl4NIQnvoK4KuBG+O8kP1
	8U1F++R8aRn3MBg4aY2NTi23IECt6VTeEZa+VbEDpdzsS097AH/CLmKiEO9PPVornzh1hoJoSpY
	yDaSUFO9JxCNsFk1Qpt+4MBGQn0fyZf7Xnv6Tm2yZvdbk1EVsL1g==
X-Google-Smtp-Source: AGHT+IEvjf8wjHz1IDZuMlpDmRvZ1PR2gWcJIHsR0vG4NMPKURJNCf3jErqqY7OwlQvDOA+3W4E9nA==
X-Received: by 2002:a05:6e02:156f:b0:434:74a6:4907 with SMTP id e9e14a558f8ab-4348c94e271mr229950765ab.30.1763487170478;
        Tue, 18 Nov 2025 09:32:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:49 -0800 (PST)
Message-ID: <4e8ef549-9c31-480a-a88b-5704f9e12bec@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:49 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

In particular, it looks like it doesn't depend on I2C...

> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/rtc/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
>   config RTC_DRV_SPACEMIT_P1
>   	tristate "SpacemiT P1 RTC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible, this should maybe be:

	default m if MFD_SPACEMIT_P1

In any case, this looks like an improvement.

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>   	  This driver can also be built as a module, which will be called
> 

