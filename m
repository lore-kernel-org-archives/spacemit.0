Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293824EF9D
	for <spacemit@lists.linux.dev>; Wed, 19 Mar 2025 06:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367449; cv=none; b=UwUQ5NPf0GJ19FOL5592Wg9EKnB2hztKbGCDqVVzFwENvgud3U57AwlvdSvehwc8lEMtvYal0V9Wv1IIVvxHbkD8Kt9Z0w2757NEpfC9Vdcmg5Tlez8Ow3Yrg1s8L6rzjKoTbregQQkWtfTUaICZBTYk84PYOu867GpKvSaHdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367449; c=relaxed/simple;
	bh=mCpTRzMCJB+v47eElDrA/ebK7+zwOda68H+kqorY/5o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IYhB5dvxoHZvAvZR3n2f3EV0TA/CqwsBounWG0k+oMyzvr/paz9+hRKHS12iUI8vS02WIkjRHwoDbxSdELSxVe2fB40lKDYc+qVHOCKjeC4BeVM7vLZdoiBixyyUF1pQVfvTtBvTqg3iLvzmwk/CTa+u9UhCSt27axZQmsWT15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv3ypECa; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv3ypECa"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-225b5448519so124358945ad.0
        for <spacemit@lists.linux.dev>; Tue, 18 Mar 2025 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367447; x=1742972247; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=Sv3ypECaxLR3kcy9QDTDZLMFoPEYqkL+fM6vX/w0nwsanf/sGnsld7vztHBj2SBk6j
         RQAl/4KfA7BZ8yGeSAvleUlPG6tlB2yEcjA5CEU/mbvQZ2f1/SpQBtg6onJZXjPVGdDw
         J/v8LexAKX4lDG0+npN9cUPkpT9OOGBq4J3kJRRmWiAjFugW9bqq77wlfA8mUkqrujAL
         sCVnn9n5TOvHNq/3ePQe1S/kMWx9CvqE2hlgCtR1ANB8xP3sxS2PUyUvtAL/xCs8Fa7B
         Jtj5tYmSsjYalkHAOMkalHQfX3dJcaCKm6id8jB1mtdFJc1fx0XpX2WfHgj4qdc2yNo4
         jqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367447; x=1742972247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=fD0SnOByBJeHGTUkQ81SbTLcJmol2lg94o6Cct68pkyvrPNoEylYmdmmRAzAyVJz6J
         EpqXd+d2Y69MxY3lh9gCyIS7Tk0f+9RmQiLofe+wa76OE5U5MIdIlrthtTajaUx2TIXs
         kIt0xWVVeVcaGeS6mAgf1/HHjlL0axed1pL83a0b7cywkB6Z24IenMdeS70wquDXqeWF
         XCZQCbKjiiHAQHNvhjvqT9MiIJrjhDJejLtAL9Vf4VUqCciN0ZKT813XSqYhBvs2TAT1
         jDjO3nuITNTAsojhhrshnfFY58gLAqflee3Zc9CHcbKX1mrOahC0K/r+F/JKtMBJDmQm
         rMCA==
X-Forwarded-Encrypted: i=1; AJvYcCWecYtSWD6h5Q68OvXIxH9jKcNuRJjcGIlF6uWi7luyFy+ao3rfyv0oNRx0hSymfsyENLjEojDnkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3GAgKXLPLA23tAi5mm8IZshvLtsk/ryfvOYS98tcOSnmLznTH
	VF2oZ7j4BrlBsayXXSLJncfcJge/ZwdQkasxJpBZpa7ugMOZfMEfY+fckHM6BpwTkiwg
X-Gm-Gg: ASbGncvqxXfDJUyGjEOylcZwLLkcKbFHPVixwvt9MqHp5uT0ZCC+LAbuvd3vWGEsrL3
	jOAn+EGaI8jjJOA+tKPvT4R0eb29u9oPPgkgY2uJ8kffgpFDeO+nfl+0s5WwtudvH9ygBdBED73
	GV3LQPSG7fCRyqwRWQr1ETH1YNAhAc/f8eelbN8ihoiSZg36z2yTEwdWy0v4LQYw9oR8hrjDcA9
	J2t4i0r027H7eYPQBV2e2EeaaNiDNlIL1JJomTKYKXpJo6ReCAOQx6xMLDoKhrg5ayj5phiMLRW
	IVX+km9bJ/A8A//BnN2n5EAlEqz4qQ==
X-Google-Smtp-Source: AGHT+IFFwhNQ/t6dDSlJCbtxQ/cI6+UzpKK0sAxbXmmxiGE86fdpdk9WXkOD2IVcXL9Kox7DXY3lpw==
X-Received: by 2002:a17:90b:2f44:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-301bdf91cc2mr3092116a91.16.1742367447258;
        Tue, 18 Mar 2025 23:57:27 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5b81casm741412a91.37.2025.03.18.23.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 23:57:26 -0700 (PDT)
Message-ID: <fbd59e2b-1d9b-4585-85a8-aec79bc10dd6@gmail.com>
Date: Wed, 19 Mar 2025 14:57:19 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/3/19 06:18, Andi Shyti wrote:
> Hi Troy,
> 
> the driver looks good, I just have a few neetpicks to point out,
> that, along with Alex last comments, makes the v8 a good
> candidate to be sent.
> 
> We still have time, to get this merged in this release cycle.

Hi Andi,

I accept all of your and Alex's suggestions and will send v8 today.

Thank you both for your patience!

> 
> ...
> 
>> +enum spacemit_i2c_state {
>> +	STATE_IDLE,
>> +	STATE_START,
>> +	STATE_READ,
>> +	STATE_WRITE,
> 
> Can you please use the SPACEMIT prefix for these enume?
> 
>> +};
> 
> ...
> 
>> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for all xfer mode:
>> +	 * bus error, arbitration loss detected.
>> +	 * For transaction complete signal, we use master stop
>> +	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>> +	 */
>> +	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for interrupt xfer mode:
>> +	 * DBR RX full.
>> +	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
>> +	 * need to enable when trigger byte transfer to start
>> +	 * data sending.
> 
> Can you please rephrase this sentence to something more
> understandable?
> 
>> +	 */
>> +	val |= SPACEMIT_CR_DRFIE;
>> +
>> +	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>> +		val |= SPACEMIT_CR_MODE_FAST;
>> +
>> +	/* disable response to general call */
>> +	val |= SPACEMIT_CR_GCD;
>> +
>> +	/* enable SCL clock output */
>> +	val |= SPACEMIT_CR_SCLE;
>> +
>> +	/* enable master stop detected */
>> +	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>> +
>> +	writel(val, i2c->base + SPACEMIT_ICR);
>> +}
>> +
>> +static inline void
>> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
>> +{
>> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
>> +}
>> +
>> +static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 slave_addr_rw, val;
> 
> please don't use the word "slave_*", use "target_*, instead,
> that's the new standard. Unless it aligns with the datasheets,
> but that's not the case.
> 
>> +	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
>> +
>> +	i2c->read = !!(cur_msg->flags & I2C_M_RD);
> 
> ...
> 
>> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long time_left;
> 
> you can move this declaration inside the for loop.
> 
>> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
>> +		struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];
>> +
> 
> ...
> 
>> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * send transaction complete signal:
> 
> nit: /send/Send/
> 
>> +	 * error happens, detect master stop
>> +	 */
>> +	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
>> +		return;
> 
> ...
> 
>> +static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long timeout;
>> +	int idx = 0, cnt = 0;
>> +
>> +	while (idx < i2c->msg_num) {
>> +		cnt += (i2c->msgs + idx)->len + 1;
>> +		idx++;
>> +	}
> 
> nit: with a for loop you would save the brackets and the idx
> initialization.
> 
>> +
>> +	/*
>> +	 * multiply by 9 because each byte in I2C transmission requires
> 
> nit: /multiply/Multiply/
> 
>> +	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
>> +	 */
>> +	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
>> +
>> +	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>> +}
>> +
>> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
>> +{
>> +	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>> +	int ret;
>> +
>> +	i2c->msgs = msgs;
>> +	i2c->msg_num = num;
>> +
>> +	spacemit_i2c_calc_timeout(i2c);
>> +
>> +	spacemit_i2c_init(i2c);
>> +
>> +	spacemit_i2c_enable(i2c);
>> +
>> +	ret = spacemit_i2c_wait_bus_idle(i2c);
>> +	if (!ret)
>> +		spacemit_i2c_xfer_msg(i2c);
>> +
>> +	if (ret < 0)
>> +		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>> +	else if (ret)
>> +		spacemit_i2c_check_bus_release(i2c);
> 
> Nit: this can all be:
> 
> 	if (!ret)
> 		...
> 	else if (ret < 0)
> 		...
> 	else
> 		...
> 
>> +
>> +	spacemit_i2c_disable(i2c);
>> +
>> +	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>> +		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
>> +			  ret, i2c->status & SPACEMIT_SR_ERR);
> 
> dev_alert? Is it that bad? Let's use dev_err() instead.
> 
>> +
>> +	return ret < 0 ? ret : num;
>> +}
> 
> ...

-- 
Troy Mitchell
