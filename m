Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2E72C028F
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496551; cv=none; b=PFWg2BE7MEP1Gnbvk6pffYr1XRiCmAp+e8cl/G7fh6CcoRqcTcLPml3wbENft2qEoKOPywHEXso3vQ0JXk8WcbIYHf3GLArE8mvj7a/sDultXPKM9x3fT+hapB58tScDytCQ67aF8Zo5tvs6QzbykZmP5BWFNBi6yS/2r/2kGd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496551; c=relaxed/simple;
	bh=cqRUtVYrNx2mzfL5GKKpB+WuYc0/JzY7v5sYxFi+aE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G83k6BKcbAUvQPmDNWzFpCf8ypKqhSz7wuOL+qI2RJX3/dNhNlzR5YTsLKbbHke/orWDEdVVhDJnPA/oqtykph2gCjczptM6AxU8Xd33lDJ7j4zZf2mMR4ST/ORjrIC1HP287B/nrauUA/I037SJEqRRBedSgXySb6rwymkHXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YhfDCRLf; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YhfDCRLf"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c69ffb226eso112840385a.1
        for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768496549; x=1769101349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/tzW0owCXuoQmee80ksiQvxxOuPUjS6h1E3tlcXBZ4=;
        b=YhfDCRLflDCUaEXEP8OYBFWmARB7JHauV93NJW78bPf1eYW/vXkEiSyqP0GIwD8Q8H
         fB6RBiZfZic1lPoZPTfWX/DHJsVQ+6n91u2k/X1Ytszx7gzqktjZuxq05S9hx3iNKuis
         xnUG8pqeBT74sesYEva3+/ABJEF2K/cv1xV2gFYah6xGJB0UUNS8rR5EXNkg/TElTCVI
         DKjYiqilAu4h0bzRDYOPRrqytiB2HLjw79iiAUqUBhi6D1RRJs6YeNR1CoXhDCFx0VVE
         koJCTO45w3lEesreSmfuc/BkarMg/GBAgcUIUU/FMcfxP+0OYC0pH3t6DxMH2pe0elj6
         +p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496549; x=1769101349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/tzW0owCXuoQmee80ksiQvxxOuPUjS6h1E3tlcXBZ4=;
        b=L5cBrGvItQsbGD+epvEx+/2saDl02gIpd282bm6RVO2qwCWqu+pFpDdhUiLmeWUZlz
         FiCrDtj2xgwEM4hWZj+HT7P0CMXeurCiITOJZadMu21Q1ID9yWqbBi+5gZ4Zhvurk+UI
         R4eOq+4S5pCg94nXR3E1d/OCWZ+7CsCbsqHtqpDE/E6RI92wPiDQHt/EaQhdAt8qp4TS
         wAU8I9TLVKUTrZH1BYpP+wyakLbUMjkAfU/FJ0rJaGOZqjC1o/uwGvyevDqHcpMa5LYC
         7Sy7Xdfsm2UZnqxxwNoBgS6E7SrxZWu4CVfIkTOZ7nm8WjBR/zhdr/P/crh2MZ2qK1Wn
         cH6A==
X-Forwarded-Encrypted: i=1; AJvYcCWME4YgocTylAOaayW+d5AnMMs1QfWCuyW4Jddcv2BWytBod07ZZMWG24cwpzWwW5ZKB9DHBMrleA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyea3ZWeY1AIhMVKsSRTcoSfq41H5LeFWjDWQU3JtiVUMn2jMPi
	IUEoeME8slPApPfCxZ+g3j+2kG+VE43MgIZN2p+q3OqqlXvyIoW/BpZhl4ccyTh84xk=
X-Gm-Gg: AY/fxX5nlSwCAW3+tLBQEqtm0HVUaPKkoYO0ofSvy4FNb98XYm89vKmanwWcYx9rRp6
	89v90EyOAukkrYVz9x5VaEN49eb2x8P0km9bLNWKCv6YNIIAUh3WkGuo4kNs73uuOotb/SV4V+B
	5NW1xgZlqpCkXEOr/47F521+w02etyA133KRaryoidri0o9voKmE18j2VMD4wdQF37pn22zRpQj
	gf9bNZdwpzq4CnGcbBPUslY4f6vKaR8RqTO7MP9utlxYGJLkoavsD+6rYGEZ1RQeXH8wLnC1ooI
	LS6hD8txI4IVyjWub5cjRFPDwuR7bFtCqMTk4ep0DZ3mZos39kKP0OOaoBPYod1saJg2C8Tt3KY
	MLJiCr6TekVxyT0zXqrXNuMpp5wQRwodVlSJyMXFR4MTGut56B2dJ7vMdw60OnIRX9TYjC0er7D
	EwaDxtAXsIkkE50shUgakfpgCUNU+xPw6UOGxwXhBipBNTHEeCJevs
X-Received: by 2002:a05:620a:7115:b0:8b2:1f8d:f115 with SMTP id af79cd13be357-8c6a678cd69mr7618585a.65.1768496543663;
        Thu, 15 Jan 2026 09:02:23 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b74bc4sm455422485a.32.2026.01.15.09.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:02:23 -0800 (PST)
Message-ID: <5ddb55a9-ddad-4e4b-90ab-2214f958ea90@riscstar.com>
Date: Thu, 15 Jan 2026 11:02:22 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 1:52 AM, Troy Mitchell wrote:
> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> enabling the use of I2C in atomic context.
> 
> When i2c xfer_atomic is invoked, use_pio is set accordingly.
> 
> Since an atomic context is required, all interrupts are disabled when
> operating in PIO mode. Even with interrupts disabled, the bits in the
> ISR (Interrupt Status Register) will still be set, so error handling can
> be performed by polling the relevant status bits in the ISR.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I have a few minor comments, but I think this is close to done.

> ---
> Changes in v6:
> - modify code style
> - modify and add comments
> - Link to v5: https://lore.kernel.org/all/20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com/
> ---
> Changes in v5:
> - optimize code logic
> - refactor delay handling into spacemit_i2c_delay() helper
> - introduce spacemit_i2c_complete() to centralize transfer completion
> - rework PIO transfer wait logic for clarity and correctness
> - modify and add some comments
> - modify commit message
> - Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/
> 
> Changes in v4:
> - refactor for better readability: simplify condition check and moving if/else (timeout/
>    wait_xfer_complete) logic into a function
> - remove irrelevant changes
> - remove the status clear call in spacemit_i2c_xfer_common()
> - sort functions to avoid forward declarations,
>    move unavoidable ones above function definitions
> - use udelay() in atomic context to avoid sleeping
> - wait for MSD on the last byte in wait_pio_xfer()
> - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com
> 
> Changes in v3:
> - drop 1-5 patches (have been merged)
> - modify commit message
> - use readl_poll_timeout_atomic() in wait_pio_xfer()
> - use msecs_to_jiffies() when get PIO mode timeout value
> - factor out transfer state handling into spacemit_i2c_handle_state().
> - do not disable/enable the controller IRQ around PIO transfers.
> - consolidate spacemit_i2c_init() interrupt setup
> - rename is_pio -> use_pio
> - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com
> 
> Changes in v2:
> - add is_pio judgement in irq_handler()
> - use a fixed timeout value when PIO
> - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
> ---
>   drivers/i2c/busses/i2c-k1.c | 304 +++++++++++++++++++++++++++++++++-----------
>   1 file changed, 232 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index accef6653b56bd3505770328af17e441fad613a7..427cd8dc6947c1d5fbdd364a351f7c065ba0b595 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -97,6 +97,10 @@
>   
>   #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
>   
> +#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
> +#define SPACEMIT_POLL_TIMEOUT      1000 /* us */
> +#define SPACEMIT_POLL_INTERVAL	   30	/* us */
> +
>   enum spacemit_i2c_state {
>   	SPACEMIT_STATE_IDLE,
>   	SPACEMIT_STATE_START,
> @@ -125,6 +129,7 @@ struct spacemit_i2c_dev {
>   
>   	enum spacemit_i2c_state state;
>   	bool read;
> +	bool use_pio;
>   	struct completion complete;
>   	u32 status;
>   };
> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>   }
>   
> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
> +				      unsigned int min_us,
> +				      unsigned int max_us)
> +{
> +	if (i2c->use_pio)
> +		udelay(max_us);
> +	else
> +		usleep_range(min_us, max_us);
> +}
> +
>   static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 status;
> @@ -182,7 +197,8 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		return;
>   
>   	spacemit_i2c_reset(i2c);
> -	usleep_range(10, 20);
> +
> +	spacemit_i2c_delay(i2c, 10, 20);

Is this delay specified for the hardware somewhere?  I.e.
"one must wait at least 10 microseconds after a reset"?

If so, the delay be moved into spacemit_i2c_reset().

>   
>   	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
>   		status = readl(i2c->base + SPACEMIT_IBMR);
> @@ -211,9 +227,15 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
>   	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
>   		return 0;
>   
> -	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> -				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> -				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	if (i2c->use_pio)
> +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> +						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +	else
> +		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
> +					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
> +					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
> +
>   	if (ret)
>   		spacemit_i2c_reset(i2c);
>   

. . .

> +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 val;
> +
> +	if (i2c->status & SPACEMIT_SR_ERR)
> +		goto err_out;
> +
> +	val = readl(i2c->base + SPACEMIT_ICR);

The assignment on the next line doesn't even matter and isn't
used unless the state isn't idle.  You could move it inside
the block below.  In fact, you don't even need to read the
ICR value (above) until you have verified the state isn't idle.

> +	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
> +
> +	switch (i2c->state) {
> +	case SPACEMIT_STATE_START:
> +		spacemit_i2c_handle_start(i2c);
> +		break;
> +	case SPACEMIT_STATE_READ:
> +		spacemit_i2c_handle_read(i2c);
> +		break;
> +	case SPACEMIT_STATE_WRITE:
> +		spacemit_i2c_handle_write(i2c);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (i2c->state != SPACEMIT_STATE_IDLE) {
> +		val |= SPACEMIT_CR_TB;
> +		if (i2c->use_pio)
> +			val |= SPACEMIT_CR_ALDIE;
> +
> +
> +		if (spacemit_i2c_is_last_msg(i2c)) {
> +			/* trigger next byte with stop */
> +			val |= SPACEMIT_CR_STOP;
> +
> +			if (i2c->read)
> +				val |= SPACEMIT_CR_ACKNAK;
> +		}
> +		writel(val, i2c->base + SPACEMIT_ICR);
> +	}
> +
> +err_out:
> +	spacemit_i2c_err_check(i2c);
> +}
> +
> +/*
> + * In PIO mode, this function is used as a replacement for
> + * wait_for_completion_timeout(), whose return value indicates
> + * the remaining time.
> + *
> + * We do not have a meaningful remaining-time value here, so
> + * return a non-zero value on success to indicate "not timed out".
> + * Returning 1 ensures callers treating the return value as
> + * time_left will not incorrectly report a timeout.
> + */
> +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> +{
> +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> +	int ret;
> +
> +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> +
> +	do {
> +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> +
> +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> +
> +		if (!(i2c->status & mask)) {
> +			udelay(SPACEMIT_POLL_INTERVAL);
> +			continue;
> +		}
> +
> +		spacemit_i2c_handle_state(i2c);

This could be:

		if (i2c->status & mask)
			spacemit_i2c_handle_state(i2c);
		else
			udelay(SPACEMIT_POLL_INTERVAL);
	} while...


					-Alex

> +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> +
> +	if (i2c->unprocessed)
> +		return 0;
> +
> +	if (i2c->read)
> +		return 1;

. . .
