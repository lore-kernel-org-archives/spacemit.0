Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF4286885
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766964267; cv=none; b=MwfbEaNFyLZ6WSKnDou7I4q1beI9rE43R0Hr/gC63HSIQpQng+W8WY50oW8nH+sXgwXkbBvH1MV/7FDUCuROKLNWCCVuT1u3sZLMeZbeP50gOAsm89CFQ2oVU0QhXCfAWTS1eX6Bj3KUyQpEKPVHY7zUgbTAAd32ku+opt0SM8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766964267; c=relaxed/simple;
	bh=OyujpZZsgmaCODovITjtJcQsqNER1AQhipqOJMTC0eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuzaHcT9GE4AFLchL9vXWFpByNNvddO+gR548Flz2IGCu1kbnurZjCjkLVCY7jfvCX8RpY+GcZM/mq42Ogspaa3ex9K116BTUPaLmEHG1kOefZjo2mC4QDykmR2dbFNPB06AMwi5ntz5RaG76q/YGKxAiJSNcfFIxBWBpc+bFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jg4RewjE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jg4RewjE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so120454711cf.3
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 15:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766964265; x=1767569065; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=Jg4RewjEnr59OgHo188O+Yk6HpPwEtFCg7ZloXktzzum3fYL57m8NmmtYIvE4THx6e
         XefM69j2kNdXaU/6nzFJ8XjN1m+ut04jKQ3YRmRzftyofZ9pu54yagq7uh5gCmIg6xw/
         M92VHCfNfXyASFxlLsjQoqjIF8mR/9DArP8NUA/grijLjMeQNUfBxB8h5sJL//e3Rqc4
         4epX5BfO785DhQex1DMUJ+CpqO3ddUeScGQJAz8p+FAyQsXOlw9PqxRzPLD/kuZwZqSy
         2kiNRTfE0y0wKXLTfK6hc1fypJGfrWhmcJSYxwezxY5mqPDzccpR9pMJRtNIEAVV4oEM
         JRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766964265; x=1767569065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=n18yCqCoG2Fj5hIi276B0hnfZaQgT4wGS3RRDU8wnaMLmRbIw53grvIAEScOn8LMix
         sha5LRYSvf9LPstcdoou4xX9PExti+4l/tGObEhBx5nrAqSeaHnFMLiDKDlySBBWD01o
         oU1hYJVv9Ya7Gh5/Tyg54gnIJUVGDfAyuMSanacspJQip+LNZu6Bya59o80XG8jUCu/C
         8TfI/FwuBuLJHBTE9+t6OGh3kchA6nBi6ih4SzugBFzBa9SNRoqY5n+oDQvrFrHtj8FI
         YYEO+nn+/pC6/3UnQHZQkX5d9788/CiW0asxBokLwH/O/vVNjTPCLPEn40/d46+NNuSX
         t5xA==
X-Forwarded-Encrypted: i=1; AJvYcCXn2vK6jpsb485amhEZMcmv9oUmHb2vk5qxRY72etCXOhPrQRcuT0fPHjNsih5ER4ZcPOMnGE1g0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDkmvcG4zeEujGBrdp6buStcc1LNFniVrFpDIoI8TyTZZJi8HN
	s/P8gTTqgSZzAfCS12kcSxrsScxryA46aJ9NNDdLzoSR/kLZeAxXfIG8skl9NJUruto=
X-Gm-Gg: AY/fxX74zaFJBv/BW/OiqeYBFkrKXlhCIvbsSt6QFrlmuqfywywR13V3CcHpan/91+N
	K5dgSs1x2YfpryIfp6eLHfT7fK6REklVeUh66NTStCeOlCMJgCCLqgeeIm63WJPOPhunmZXBo1d
	bNrufalXXv5xPh8o2Cj9LRh75Y9lvrVSbaMS5Fojsu5Ws+gN+fyZchYENUdhuGSbzV/GkktxvVT
	+ce0jGYNpuIq7doj3XQbTJzVblbJI+NtnZ1xxWFv5deFdV7fjzBVSgcPWQi1FTPM16ZxmqVISJr
	P6wwtn3CfsErs96XZPYISNmW8SbjTzhpv8vKfg6kewYu6TtYfw8cAaHHOwNlVUzmelD6O8TELzs
	sTVB7o8pUEqXiH5FcHzYN9NC1af42wJUrqUZSyhE+ax/J3DyED3QG+jQ4/8XjHzqi/l7KlnBCLD
	4brWrwPQlvz0cVCr/XGWSox/kZlsSbAC2WUVbyi+5vT5mmY7nwkqo=
X-Google-Smtp-Source: AGHT+IFxndCaQ3g5mQEld9CJ+Zg2xTQQHo+r3w56Ps2u11p4W4wTawdR8ANKUOQfAZjJSvAqZ/++TQ==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr169416911cf.75.1766964264478;
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64c011sm207819451cf.25.2025.12.28.15.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Message-ID: <bb6665f2-e4c5-455c-b6d0-9acf41aa9e30@riscstar.com>
Date: Sun, 28 Dec 2025 17:24:22 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/25 9:31 PM, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Other than fixing "replace" with "move" as Andi mentioned,
this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   
> -static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> -{
> -	unsigned long time_left;
> -	struct i2c_msg *msg;
> -
> -	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> -		msg = &i2c->msgs[i2c->msg_idx];
> -		i2c->msg_buf = msg->buf;
> -		i2c->unprocessed = msg->len;
> -		i2c->status = 0;
> -
> -		reinit_completion(&i2c->complete);
> -
> -		spacemit_i2c_start(i2c);
> -
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
> -		if (!time_left) {
> -			dev_err(i2c->dev, "msg completion timeout\n");
> -			spacemit_i2c_conditionally_reset_bus(i2c);
> -			spacemit_i2c_reset(i2c);
> -			return -ETIMEDOUT;
> -		}
> -
> -		if (i2c->status & SPACEMIT_SR_ERR)
> -			return spacemit_i2c_handle_err(i2c);
> -	}
> -
> -	return 0;
> -}
> -
>   static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>   {
>   	if (i2c->msg_idx != i2c->msg_num - 1)
> @@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>   	complete(&i2c->complete);
>   }
>   
> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +	struct i2c_msg *msg;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		msg = &i2c->msgs[i2c->msg_idx];
> +		i2c->msg_buf = msg->buf;
> +		i2c->unprocessed = msg->len;
> +		i2c->status = 0;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (!time_left) {
> +			dev_err(i2c->dev, "msg completion timeout\n");
> +			spacemit_i2c_conditionally_reset_bus(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c->status & SPACEMIT_SR_ERR)
> +			return spacemit_i2c_handle_err(i2c);
> +	}
> +
> +	return 0;
> +}
> +
>   static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   {
>   	struct spacemit_i2c_dev *i2c = devid;
> 

