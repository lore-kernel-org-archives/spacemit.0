Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB81684A4
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969794; cv=none; b=DHnocGwWK4HBA/sTmrI0LMeFfXXWJuxgNl4RXuD74WoVBkRyeYqpZp0iFAfeyS4AGjNYVbIZ4SYb3t5XsM/8LUjlrGGHmg2lHp2nwJukn4hIxQDI0e3rsIFK5ZsR/lZOyDAH0XNNJlJoMIuzLTBM/GJa/j9qm2QVglVDscwcPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969794; c=relaxed/simple;
	bh=R7P3tj+3DpYdL80hTXevwIvi3bBtH27nXSZVF9DjC2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNxbrXei50sYtcy9EC61h55OtApm6a07GQqPhu6Ez3wqFt1ndigT0EGuCY8N9uIezHBh/dHOxdoFTsyxkyBuYU4GYAF7JcGMYEW9O4GVUK3EhNmHq+MHu2G+mwi2ShIFUZ1MSoEY0pPljZvU+GEoTj/+HyrG362S4SSLs1HHHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mykOK2n1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mykOK2n1"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso638764385a.0
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 16:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969791; x=1767574591; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=mykOK2n12+fwLS99EiVS4GuPos1p2UgdXFlj+lQ6P8cWzHwnYdaPpfihyOLScDQDoS
         9fvhcHHgFgrjiquXzhA1mR/l9IDAwEsvQtHEc1T8EdBjLqVW7X2psTZqIHjHAjH0ZLba
         qVY9Vymun4afOqYP/MPNeTtV+/y5Z0/2JWbw6xPRvHKWPA484S3pHZc4XigXmSZT/JX4
         WOdyaKxyJEuQNw0dchwu+/9/Wo+B3f1Ec0pLf6Bm4ZApwl8xFRi0+p7tfUwMD1D4+bgM
         XsfoDpWFvKuFKbju8VQxK94Y6zVIE5SZ13WcHO3JCgcijugYrB4p2iInNFOpzizoBBd8
         zNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969791; x=1767574591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=KxWLjwjElD5qniIEDBoy4Au8iMEjvMIt/rjiye/H2DZVkvt2iwx3B6LAMWXGTdwpQc
         afACaxGgqKdypPI2PJ2nlp/efjzZ8LzdMPqEvkEKtCzEnBGWbFrl2pYbVcghsGvZhCmk
         kCfKq4B8eIvYEQEVE4Gl8w5hBSEMsJgQs2xncEY+bZH9Q+/l2ej+UPDZ3X5tmymHMrfj
         7H18faOsnk8cYnuj5NQMlhHiLgLi2qxA8idvYcwRFwzf/2aqK/yQ/msoWqc3QrRcxSRe
         vrEPDLCJTy/jMg/lLA0TSMYYcSXgq7TW5rxcL8ql+U8EB6lzOat7YU1xxM2stwxFb75X
         J6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCV8VsUjmGM9hM0UkBFpNmjRg3lKGknJm0m5dD+/2MNulyLbeC9qsRj2FsktqT7E1a69IgG/H6ZOTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqbvyV4BdSUXbBYVcFOGlP2l2Fhb/gmGo/CqyCIo284xrOKhOY
	7QoqbVEn8Ixcbzk5b7HDlC/Zan+dWX3PmChvkNC2OyDieZJ9vIJzibOmhAJ3iV7jIkjuGukfwbJ
	VfJkENJ4=
X-Gm-Gg: AY/fxX6CnS1WxjwUSKr0D9J4HBJTnJpR0Ccsrrp6g217M4u/d6/pXAk12GkdJvLS67x
	Ce0Bz2cxA5VaoVQ8Eu6QNAR/qR/C0MAEMwgYIPMuUcL9lAjje0WdwCE8wF5mrn+4uCJHPhWrkg2
	8mNSJFcMMWuuEGWSCtCd2QiZC4tMykzz5NbVKkw3hEZeyik1WdFttG4FBBd4O3aMZBFyLsRsALn
	/qUBqjevdqRU0aWAwZyBOwWIaS96NGGEG/S6jthHPMMEDdfWvZ949QcIA6MQefA074K7FLoLrnH
	5DVa0QJbBASLqezEQu0scqBNMsu6VJv45hq4TvibJ9JKlAhG+GbZSuPSoWRRKDsySPxI074AVWx
	uuUfVxUAIYuFB3tJ7KzRtAHWjr6AJdyb0fJpMOGclRRpoi+I1eUzs+gyeqN4sOyv+yHSg60JJD1
	V+0OMfGfpe5peSWvmFyKDBXSAEq/6ZjWTWfp5oMQJsd/Evu+Kptbs=
X-Google-Smtp-Source: AGHT+IENzT1DKL1F5+uqdNfJ9tGhxzUAN82qDRGsR1PVryT+X+ZT7PyJmy0IlyTNV3YfgZM449EDXw==
X-Received: by 2002:a05:620a:4055:b0:8b2:eb79:d37d with SMTP id af79cd13be357-8c08fc00228mr3954919785a.4.1766969791407;
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Message-ID: <a0c9f9d0-6453-44c0-a5b1-8d1b501acfc9@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:29 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] i2c: spacemit: drop useless spaces
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 2:31 AM, Troy Mitchell wrote:
> Previously, the I2C driver had an extra leading space in column 0 of
> included header lines. This commit removes the redundant whitespace.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..30cdf733deef264061c8ea565634c5a17f5aebfd 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -4,12 +4,12 @@
>    */
>   
>   #include <linux/bitfield.h>
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   
>   /* spacemit i2c registers */
>   #define SPACEMIT_ICR		 0x0		/* Control register */
> 

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
