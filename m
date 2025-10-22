Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95AE1F5437
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107442; cv=none; b=ogB3bQ78CHmeBvoA7OqQfGG6/knt8RA56IAdROFybxlU0E9gUQ0h558BFTT4jGf4hxczaNrKaIAM5t7lnpE1KDYg81DBD2yzbd3MxE0jgp7W64kDGGnnBoY1rCBO8Wo3+S9T0apPFmfMB2VMr1kBmItgvUB2GpI18rmiyltvdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107442; c=relaxed/simple;
	bh=c3lovmv+mOVMEJUmhqHzv3/fwYfbe0mJdOLie9Y75RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIq54/8+XvT3CUb3h65WC8nE/TsUEj/L1Z4rfKoNS2+kmW8RYFeRuUsTI9skcSUjPOmtuDDQ7IIkmCRwbbQ4F1DAfVt/o6t5CdEdV4Hh2jj3RT3FMxv24qejSL4wZwDJoCS2QECTMjjui2QOx/mX+EARQtftcqHGDVj3Mv3IupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VAykdicF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VAykdicF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33be037cf73so5009651a91.2
        for <spacemit@lists.linux.dev>; Tue, 21 Oct 2025 21:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107440; x=1761712240; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTcnGjhUhb8jKzTF6L7XczC6QFzv26Nhm3lCxckjhLU=;
        b=VAykdicFXmlPPiyKXkfqVYU6uYFMA/rh0rReIi48VOnAWfP+PlHXiW5Yq75VGjgjE0
         77XHrnlYEHxCdXjU19ZqOKL0t2hfZM7LLcApQUPEuwfFnbb3lDfbjz5KYfQuOhaIjrD+
         eN50zkQ/8B3GrDpx7IL41cx4i9qNJI5qZ2YHB8dZkMNhm/CBsAfhQAYGgkR0l87YWUYY
         2y55C+4uPUTNgFUd2EYXXbqh7CoC6eOXfQZH6TiOxpnbHE3HzCJM8GQd8Nc++2eS358T
         O2nZn5dmoREi+wATXog7J88muElvJfb6U7RGqgjyCV+RMfLYOcssAbmGyRGv+IQGPEAD
         Hklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107440; x=1761712240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTcnGjhUhb8jKzTF6L7XczC6QFzv26Nhm3lCxckjhLU=;
        b=r3ibNFQvlkjctWVnGA4G/m3alBHWIaSWstddES/0TF9Snmmh3yf8gGfJFcDfZDcTug
         f5TK6eF4QKcBKIs4ug3hR3/BqvXoOySe9fsZOuWs+BcryBcuzG7F7iZ/j9KDaBvAxi2v
         c3OsC87UQayuhBN8PC83lpa3SKL6dY36HanqxxMn+cUHcBQjlrCzkn6NdqDmnBz/eioa
         nj3a7oD/ouqoqHxXLgl9/uVmU6VfhWLr7QuabzJ0L0D7LYoldxKlIMS6mzULxYcp7PAT
         DatwBd3kihiXt+xlwvChmNgeet2OQwdSd+OCQhSNV4bVMpJyGYfUEcMIBy9genCKtOrv
         4SrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO6TqVBLmSwptk7PbXtFeA+m2d8Wb21NHOhN1q/zZbdKzLu2EHjCBhC98FaUJIs8rGxgj86BdSrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI+2ayzShb3YrKFIKnM2ZA9aZK6xDOG9V6kJMjmN3rJDqmeLYi
	zHE29NP0KC9nSzL6/wWTh0Ph2ERkFtspkHlt7CpBxJeVhwNIjPVB2N+wpdoFtLk7DLJh1we6pp0
	XlbTO
X-Gm-Gg: ASbGncs7etkKqeg5TLB8yG6lFv+zWgZIIr0seFO8iJB0M0iVyxkzdT6O1tIyBk213Zu
	Lw4V/SwjEKnQMmcD9PKdV2Wl/08/6Qx1WCYVVMUgubMLKR/WEdLJm6VQDh81wF0cRb44KbR3CbO
	Tr00k2m8xEi2obMpHp6rG0V58RU9+qza2mRHttrzbD82yIfO6Gwz3jclprHpnCSHxFBU0KD1QKu
	IFcBtOuprGjujRX0cyM7JAjIqQM+thpG5C5PTtuU+QPtRXB1hhTjrBRWoW3mRgXMVF6ReBZ0/Fk
	IRGA2oL5u2FWSKoCdDUIt8HgRUOc2F9qaeEbsLG4Pxnr3oDMFlRpbATPN6kZhU+UrtU5CQPRESM
	bQC6swd3GzjCF2WifLHPjewTwyXy/2KBpTdt4bW0FAnK3lklHDsof4k7mWpfWxT53qRQeoaVGPY
	CAb0QLm/QGEY5dlidrUf1muMQ=
X-Google-Smtp-Source: AGHT+IHCvLgZS4hGuZBkDCjjiv46qhxkjKqpH5V3aq6Xzke+jWUJSrYYnDrBe5cM1LQ8ndK7Tc07Cg==
X-Received: by 2002:a17:90b:3fc4:b0:33b:b453:c8f0 with SMTP id 98e67ed59e1d1-33bcf8f9008mr23774051a91.25.1761107439935;
        Tue, 21 Oct 2025 21:30:39 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11e1sm1236623a91.12.2025.10.21.21.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:30:39 -0700 (PDT)
Message-ID: <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
Date: Tue, 21 Oct 2025 23:30:37 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: simple-mfd-i2c: remove select I2C_K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/25 8:58 PM, Troy Mitchell wrote:
> select will force a symbol to a specific value without considering
> its dependencies. As a result, the i2c-k1 driver will fail to build
> when OF or COMMON_CLK are disabled.

Should config I2C_K1 depend on COMMON_CLK then?

But you're right, the selecting config should ensure the
dependencies of the selected one are satisfied.

> The reason for removing I2C_K1 instead of adding a depends on condition
> is to keep the possibility for other SoCs to use this PMIC.

Acked-by: Alex Elder <elder@riscstar.com>

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/mfd/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
>   	tristate "SpacemiT P1 PMIC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on I2C
> -	select I2C_K1
>   	select MFD_SIMPLE_MFD_I2C
>   	help
>   	  This option supports the I2C-based SpacemiT P1 PMIC, which
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f
> 
> Best regards,

