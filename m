Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46E31D376
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212547; cv=none; b=JtOsSE/iLMHa7NTuLvwn9CHnSLvIDZ1mtBuHss1OqSXpewtZ0ixFqUwqKtqRJbqxbSef7fqc0cP4K+J3nN/1+JNQ87rBd0MiH53jPM2jXI6KxAXP35YFgpyxOp/yAK7q01UnjlC/h0xEhZKGn0VrxOb3BCJ2KfOfTgyj63ziCec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212547; c=relaxed/simple;
	bh=JmMOdCGNZ0SBHOnqV81I+/ZKe28nhMfYW3ASbme/DJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtUBc9AXHu3+eOaj62eeulpNSdOtLY/wIwVEzu72ahqX5aqovYOH38I0FI4A/0wbnoH2lPyKEvMRtyQO5l5zyrYeM8sdFi7WtSTj8jjKUM6wOjwdA94/NpuQKTzHVexgQiT+Lv1mAQBfDguEi0MV3c+iDqwf29cPZBljNhGF6Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oWfWo9QU; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oWfWo9QU"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42406e56820so5979995ab.3
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758212545; x=1758817345; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q60ma2V2EhO0+PfY8j2XOpbs7KGOot7DJdfuAqVmdQM=;
        b=oWfWo9QUswq23mKMJbyP1CRQwlCEz4vbtclFyRIoQWi+wpSO1Es08NvMv1OwVOKjQY
         YwxyL/zgK9/1q3IYDw0y6mG7qIjrF5q8f+LEu1j8soRO8o2CKhNJeAFsxXpSMdGuNrbu
         gPPiXpiKcmIhdOo5n8Vqa3AujG6WOd7IpX4QtY9vuOrBB9Or1f110PZQxruhT2Jd8bJe
         VzBPPZFtLiiVakP0eUl4wGob8/iv7+iHppRAOTNYHrpbySU94Wj1bzHVVqthZZpSZNRp
         m0Gav+1iRh0JNyNmUCJyM4Sr9tlCZFYNa1eealO3AU8Nkp0uTyct+gP4wk1C80M/p6Oj
         1Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212545; x=1758817345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q60ma2V2EhO0+PfY8j2XOpbs7KGOot7DJdfuAqVmdQM=;
        b=Bse2yBUSQrfdTAge5OOaDdNsoWwQruIvAeUz1jb/v0+gE/SZd2YG2oAzbjZgcuhs76
         +yqyomVIEWe+anCtQj/rS6VKdXlQbgUXaaxcBIedZl+T1EDD54P8Kc7n/oXFOhzQ8kdz
         bbjf71D2rIyXuSAcBW9R3dwHMIFc5wIbtljKsFWfvC1zaE4bpu3BsyXmd8WioAlg57q7
         FokdVdGfoi7cZ5zJK0uSugXFkOZgTBznznp7gEf2wP7MccPgRXswCqUePIAGw62gOevJ
         2PpYMe+9IXEKDsVf9o6XzCxZAPszm1xEvU+mM7SaEES1yy9yfeTZoZGThnzyJJ25mDxh
         6VtA==
X-Forwarded-Encrypted: i=1; AJvYcCXRZ/0bYRO0VULGTWpkHd5dkJ/9xM/I7qDdduSC+/EYkbf7Xn+iqurhAijPEznNCpXqpzPe0xhHeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx8wuQr6mlnWYbiEIeR1zf+UUA1Yz2vAJAlp4QQTfHw34+dtSo
	rR2nvxeOMl+tLIrhT2U8YK3wEIGWT8fZF7jzG6CDXOjON/oMKYMKnToG05hGW/QSTAs=
X-Gm-Gg: ASbGncsdL/6au1w2FHVy58GQbCmyRpHTAiPXjHHqb8fFusj3CslcSDivzBVj6bc7M2P
	fVTplc322XIp4saiiEXf05arO8WyNm1rjU0+GbeI2cWJwHGBmyGqYhpHqmYAgevEu2Cf8CTSpzf
	h1EQHTnPaXmfwDA+I3gU24qg/LRlSQnUPWTPRy0T42usEJXCMsAayWh+pIO7FfYwlwtlb2HBP3i
	wTjq1gGF8Skaanrqn2gu2bPiXvqM/5/Zd4s/E78ntWrNoSJYu9q3cW0UWYUxGR/EqN5uuOEjQwc
	xOxjV9w9aAUTrxkTMSsAHzEeGbIhYUIlkKFQ2m79i2tZdLuxhOprag4sfD/zFSVnhrrgJcSnAZn
	IfWig24sl0VkpIffWZ20/wXNP4tSBWWLEUHm08l2OXyJwb5hzJh9KrVJ3nGeSoksup8LrQqfZId
	FsrXzPPNXkVe3u4TAL
X-Google-Smtp-Source: AGHT+IHno87PGRHfIe/4sYG48mSDNVPM2G0IVfwWSmkQa5Io8uxPrbllpYQCUBUanWZMFS1pdWGK8Q==
X-Received: by 2002:a05:6e02:148c:b0:424:80c5:87a with SMTP id e9e14a558f8ab-42481984015mr1925725ab.19.1758212544749;
        Thu, 18 Sep 2025 09:22:24 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e3373f6sm1110059173.29.2025.09.18.09.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:22:24 -0700 (PDT)
Message-ID: <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
Date: Thu, 18 Sep 2025 11:22:23 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org> <aMwYRGjTdbQCJf3S@pie>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aMwYRGjTdbQCJf3S@pie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 9:33 AM, Yao Zi wrote:
>> .. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
>> select PDMA driver?
> The driver seems to depend on the generic DMA engine API only, IOW,
> theoretically it should work with other DMA controller as well. And it's
> even capable to operate without DMA (see k1_spi_dma_setup()).
> 
> Dependency to PDMA really doesn't seem something should be enforced in
> Kconfig: it doesn't exist in code level, and the driver is actually more
> flexible.

You're right on both points.  The code doesn't *require* PDMA to
operate correctly (to my knowledge).

Yixun, what do you think?

					-Alex
