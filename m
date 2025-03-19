Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98125523F
	for <spacemit@lists.linux.dev>; Wed, 19 Mar 2025 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742388174; cv=none; b=VsC8G8PnYDayrfylj9zMV8/8bE159YtFjwGwxQL2v47I8TYgPQL8UWASCn6mMdz+8K51bJSUCVT1bs5WXZx0IUtgWcFFXdD+2QId5Gv4YrMp+5f3x3dl1DPvUyagg6d/Re5TJp/wBSN4nSGnezX20xHqQIBfaf5bZk0J0rH4ZsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742388174; c=relaxed/simple;
	bh=fZ4N8rOOZtziflSX/PfQXG9Biqs1R/I42srqwO5HUfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+A6JnLGtAbkl50wBOVp5R5/Itul3Qvn52V/Op21YrS1740aX1pT0TxtF+TOzathYX783TjKyifLP2WJEtyFVIBqoJtiWz+GX+km4N+LREgFis92I2lO9+Y3dDcP1YfnL67h3OxfRsXuJogbudTuxvMgx62cZTM9EurdSPwe72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=aHNFibE0; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="aHNFibE0"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85dd470597fso139117239f.2
        for <spacemit@lists.linux.dev>; Wed, 19 Mar 2025 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742388171; x=1742992971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=aHNFibE0EpUJK83uONrWkwx4imX2b3E4ATyMd+xaKVG7haz+1DlO50PrT/7BCmzBbV
         kfoiScsIHP/inb9jVL8IVpTlxGZdAwAWb9N9pJxt4rZE2wK7UM23V/Dkp+AJwTto25WM
         TbvqSqc28aIkxEQaCzPM2uhsWLFQ9V3mAzmC0yY6Rg7+tJPmWB4CT883+zirKuuTeW0H
         k8YgzqCHSo4dM1HOuz+lhGhusn4AgZGzQFwHCjUbfUEGXCFg+PqlqJ63WzRYvFmwSZp4
         IOyPHbRls5ivRXS4Dmkx0Ctif1G1DwI57KyFkN8724nUNjmsI4vzEh8GFyrU3iQqrFjj
         gOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388171; x=1742992971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=gQsbNEw7mLyQWZV5tJoXvGCwQ3J27OvOrBj306kDCC19B/4abCXpE66HH7X3v/dvtY
         HDl6KG0QNxRmozoF3P79u7uifhVmhCHENv4d4lvFLxTU0/uvIZArF81kqB3o/LE6stCN
         eFW+1LixLBN8QrLh3A84Rq4BKEiSRVpJ3I0Now6rZZYRo9DcpoWY4kNnZgrXZ2SVmweC
         Saz3GX+QZVu/KJqpb11jnjiy61p5YbYEz/K1BfBpYj/zkSfiNbu3WrSVkPPOGJ4gANB3
         cmY9UmiPk02RV0iPGAGOF8oO3oQfsQPmI6MS+lo0VHjvqFCN/v5Umbj9ngdvnxZ1kjYk
         MJYg==
X-Forwarded-Encrypted: i=1; AJvYcCWwVaP2Tyg2HfB9ZyrvpMkdWC6OP7nfbED0LZ+Mxr8BMnHYDKKkrcD448jDs9aNuQ60cATHhYv8xQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw5re/fLLLvb6LTg8saoycm3rIAcnrtIo/KWwTdRs4bIkYJwHL
	6COEMu+fhTEZgQV7ukES/VUfATK4cy5uBy4An/TFDXGkS38PknIcI3/rR1eD5t4=
X-Gm-Gg: ASbGncsfXHQlIabOypTu2KDLWv4OZn1rMlk7J4K/RjdNHFPyPlRsSQ85uB4Dvr2W53h
	SNkx/eyim9eiExd1WTtWlGa9i2A7u9fYjXPLfWtimKY3bbRuywixX81sbP11rEa8yV3ElTipTDp
	dYrgxvcaIQQ2Mz+YoLJZ572H9M1RKUKQI/htlceb+RzBIMlQ9hT/SNvMnOs5vjine1F4rflpg1H
	xMJ/y3c3UPCcJmInjv0ciHIjkveSe3pLIJYgzfKDkjoQ/flryL4bevP0ch3eUTDQGcyP8QcWST4
	3zZI6mNf2fdJmmzB5jt85hcE3gUQxL0jMDFk0W07IiVjRa44/SSsSM3IH8ImZsc1KXRIRRfwlij
	iXPYCcIi+057JLqCrOg==
X-Google-Smtp-Source: AGHT+IH7sjljQM+QmrKBokA3matC2RiNwzx/l2tsu1F5XWLbsNSdMzt3SBx/tCoCiYaMZ1SyjlQ1fg==
X-Received: by 2002:a05:6602:388a:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-85e13870076mr284771939f.12.1742388170792;
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2637fb184sm3185854173.92.2025.03.19.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Message-ID: <967f135b-9592-4f85-86f9-5c3e31123c3f@riscstar.com>
Date: Wed, 19 Mar 2025 07:42:49 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
 <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 4:29 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.

So you removed support for the clock-frequency property, which
addresses both of the things I commented on in the last version.
This is great; I hope Andi is satisfied what anything else you
did and will merge this.

Nice work Troy.

					-Alex

> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---

. . .
