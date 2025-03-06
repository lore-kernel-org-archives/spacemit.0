Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5A20E6FC
	for <spacemit@lists.linux.dev>; Thu,  6 Mar 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267009; cv=none; b=cJhK4TUbPzJs189kzM89C8IGCV5kWqlKaOC0xxi4BGoJuIOfWCX18qjC3AT23+D3/kViKUaCSkYhtZfyPDd2qdQW8CfBcjgQ+bXQqusHWU8DHfGMz0ueVl+IvWi1tysHzeOf6csn3NhjhnD5KvpKVuPltKC7k2wBpnsERMOLY+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267009; c=relaxed/simple;
	bh=BNTdlz+O6/yoAxyZStm5+vjqcla/S1CJaC4VhpHhXmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qozcsT0OH/lIywegFx2OEylOR4MEttE02HWjhpeXwaiXTguJ1tFdZ0cQy4ZfrDPZWxBrk4+bd+ywHjMJb/0vJerT1Q80cZDe4aJUpTi5QTxo8srbNiFnxWcE3yz1CiFKWiNQda6fIprn7xmtAIsWTje9g0+dFniJNglKMBSVNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjiTyYSI; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjiTyYSI"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22349bb8605so10004345ad.0
        for <spacemit@lists.linux.dev>; Thu, 06 Mar 2025 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741267007; x=1741871807; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7U7pk8UvOy5bs7uwLzg5dC0QofSOExWhjQaOhFe4NU=;
        b=RjiTyYSI3oDLoa+xj+xPFgKqCfk65BVYG+4HOsJ9S2bDTWP/vOcGZuE78YlxtTbcZM
         DAgj/yKR3qjI1aea48x0DpsFF7arj6cW+078ae6I4xnzs54iog+OKspyhzvlEer1mCdx
         0q2oVedpFEfhUYoBZFbCriG/884eGBoklpZJ/hn1rmow4sWNNyJqg/8FJKAY5v/ddmdE
         KHma7bqrkrDsgHMga53VPSDaJuDpcfjxroVRgKuUf6q2xjxtJqge9pxQ5J9gbO7Konl9
         51ti7V+KOJGcOSZE8stiiv8nYAs/khgjGST9J0Zqd1ov5PX0eZAHwr96m1ITUNh3T4UU
         4Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267007; x=1741871807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7U7pk8UvOy5bs7uwLzg5dC0QofSOExWhjQaOhFe4NU=;
        b=V3DJqwbqEt5rILXpk3UVMNHNOAYouL4H/ecXJZ01GaDClV3kZfYduXsK9sK0fvBhPC
         Dcy+O7EX9DOF2PGN/uZjgQA2/XghzIfrs6vYp510L8fF7yjA4A6XSjqaDnhIL0OJ1Rm5
         hHYc7T3BhWYyGkqR4yDXSZJbFeXnwDuLH2JhfNoYVrvORqiO1mj6Q4Tuo7ogc/q84DqR
         tSH45CQz0+ARpc4Uxbw6pFZgk+eqjAMF73oI8KKDWPjHfopl7/U/cZcr8G9Vja4RK7xc
         /6aD5xDuszt/i0gDpPCPl2Mmdo1DYPFpvAHBpvT6X8/lh7B9reLQkzEHJO2Rmw0fEXGH
         qc7A==
X-Forwarded-Encrypted: i=1; AJvYcCUlMe3EHcYL4HmjijNVsr576T+vBW4+U3lEVG3Irphom+1R6UwvBPH6w5DngeSKlW10Di+dtYjSrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNjvz0Lbz7ROl9mN/FxxtuUs52dAFC4HTs6Qzk2AAvgqeW0V3U
	XFj6Sl+RDBRNoYTZi4gWf+2ZcxWqxD0wLj61RiIZEDTIrxARXc3g
X-Gm-Gg: ASbGncuIFbWxdmdryHq0PO3ZMrpybfSGuhZ2QrLn8vbD+76QkDseCKdo2oZ5WZNtyNV
	BJeETwaE32ukH4CTIzx4esM7RX0qaskIxPUADqaKqucOzOkS8Afki+B2JzA38EpelX/mzrqbvmT
	56woz4AEasIWezvsy+EpNlwkLxcJe0wivExTfXTmNDkpdMFXHLo1aitdCZhHoedNgyyLN9ZkxVb
	royx+9PADURCLZcFbFZVUar9dGWH5cVy9anveUIcn/AOMEJwaQeflz0HF3KQ8Vhsw7T34Y3IcOo
	hAsn4EsRssX76x43tNFrQs03kLN0
X-Google-Smtp-Source: AGHT+IH08B/pnoIFoMdt3ja0MC9Y8MP+37dUqKED3147DhyKQtyIeRsrx4pZtAJ2Zf6ULLi0sy2u9A==
X-Received: by 2002:a05:6a00:14d5:b0:736:2d84:74da with SMTP id d2e1a72fcca58-73682b84ef1mr10341398b3a.10.1741267006841;
        Thu, 06 Mar 2025 05:16:46 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736985158f3sm1303566b3a.137.2025.03.06.05.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:16:46 -0800 (PST)
Message-ID: <74b70a83-e10e-4496-9bc6-e376211db670@gmail.com>
Date: Thu, 6 Mar 2025 21:16:37 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
To: Alex Elder <elder@ieee.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <ff0faba3-08fe-4ddd-803c-03df4e1e1e2d@ieee.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <ff0faba3-08fe-4ddd-803c-03df4e1e1e2d@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025/3/4 08:01, Alex Elder wrote:

> On 3/2/25 11:30 PM, Troy Mitchell wrote:
>> This patch introduces basic I2C support for the SpacemiT K1 SoC,
>> utilizing interrupts for transfers.
>>
>> The driver has been tested using i2c-tools on a Bananapi-F3 board,
>> and basic I2C read/write operations have been confirmed to work.
>>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>
> I have some more comments, and some questions.  I appreciate
> seeing some of the changes you've made based on my feedback.
Hi, Alex. Thanks for your review.
>> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>> +{
>> +    u32 val;
>> +
>> +    /*
>> +     * Unmask interrupt bits for all xfer mode:
>> +     * bus error, arbitration loss detected.
>> +     * For transaction complete signal, we use master stop
>> +     * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>> +     */
>> +    val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>> +
>> +    /*
>> +     * Unmask interrupt bits for interrupt xfer mode:
>> +     * DBR rx full.
>> +     * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
>> +     * need to enable when trigger byte transfer to start
>> +     * data sending.
>> +     */
>> +    val |= SPACEMIT_CR_DRFIE;
>> +
>> +    /* set speed bits: default fast mode */
>
> It is not *default* fast mode, it *is* fast mode.  (There
> is no other mode used in this driver, right?)
yes. I will talk it below.
>
>> +    val |= SPACEMIT_CR_MODE_FAST;
>> +
>> +    /* disable response to general call */
>> +    val |= SPACEMIT_CR_GCD;
>> +
>> +    /* enable SCL clock output */
>> +    val |= SPACEMIT_CR_SCLE;
>> +
>> +    /* enable master stop detected */
>> +    val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>> +
>> +    writel(val, i2c->base + SPACEMIT_ICR);
>> +}
>> +
>> +
>> +static int spacemit_i2c_xfer_core(struct spacemit_i2c_dev *i2c)
>> +{
>> +    int ret;
>> +
>> +    spacemit_i2c_reset(i2c);
>
> I don't have a lot of experience with I2C drivers, but is it normal
> to reset before every transfer?
>
> If it is, just tell me that.  But if it's not, can you explain why
> it's necessary here?

My initial idea was to keep the I2C state in its initial state before each
transmission. 

But after testing, this is not necessary. I will move it to `probe` function.

>
>> +
>> +    spacemit_i2c_calc_timeout(i2c);
>> +
>> +    spacemit_i2c_init(i2c);
>> +
>
> Here too, maybe I just don't know what most I2C drivers do, but
> is it necessary to only enable the I2C adapter and its interrupt
> handler when performing a transfer?

It is necessary to enable before each transmission. 

I have tested moving the `spacemit_i2c_enable` to the probe function. 

It will cause transmission errors.

As for the `enable_irq`, I think it can be moved to the `probe` function.

>
>> +    spacemit_i2c_enable(i2c);
>> +    enable_irq(i2c->irq);
>> +
>> +    /* i2c wait for bus busy */
>> +    ret = spacemit_i2c_recover_bus_busy(i2c);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = spacemit_i2c_xfer_msg(i2c);
>> +    if (ret < 0)
>> +        dev_dbg(i2c->dev, "i2c transfer error\n");
>
> If you're reporting the error you might as well say what
> it is.
>
>     dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>
>> +
>> +    return ret;
>> +}
>> +
>> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg
>> *msgs, int num)
>> +{
>> +    struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>> +    int ret;
>> +    u32 err = SPACEMIT_I2C_GET_ERR(i2c->status);
>> +
>> +    i2c->msgs = msgs;
>> +    i2c->msg_num = num;
>> +
>> +    ret = spacemit_i2c_xfer_core(i2c);
>> +    if (!ret)
>> +        spacemit_i2c_check_bus_release(i2c);
>> +
>
> The enable_irq() call that matches the disable call below is
> found in spacemit_i2c_xfer_core().  That's where this call
> belongs.
>
>> +    disable_irq(i2c->irq);
>> +
>
> Same with the next call--it should be in the same function
> that its corresponding spacemit_i2c_enable() is called.
>
> With these suggestions in mind, I think you can safely
> just get rid of spacemit_i2c_xfer_core().  It is only
> called in this one spot (above), and you can just do
> everything within spacemit_i2c_xfer() instead.
>
>> +    spacemit_i2c_disable(i2c);
>> +
>> +    if (ret == -ETIMEDOUT || ret == -EAGAIN)
>> +        dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%x\n", ret,
>> err);
>> +
>> +    return ret < 0 ? ret : num;
>> +}
>> +
>> +static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>> +{
>> +    return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>> +}
>> +
>> +static const struct i2c_algorithm spacemit_i2c_algo = {
>> +    .xfer = spacemit_i2c_xfer,
>> +    .functionality = spacemit_i2c_func,
>> +};
>> +
>> +static int spacemit_i2c_probe(struct platform_device *pdev)
>> +{
>> +    struct clk *clk;
>> +    struct device *dev = &pdev->dev;
>> +    struct device_node *of_node = pdev->dev.of_node;
>> +    struct spacemit_i2c_dev *i2c;
>> +    int ret = 0;
>
> There is no need to initialize ret.
>
>> +
>> +    i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>> +    if (!i2c)
>> +        return -ENOMEM;
>> +
>> +    ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to read clock-frequency
>> property");
>> +
>> +    /* For now, this driver doesn't support high-speed. */
>> +    if (i2c->clock_freq < 1 || i2c->clock_freq > 400000) {
>
> In your device tree binding, you indicate that three different
> modes are supported, and that the maximum frequency is 3300000 Hz.
> This says that only ranges from 1-400000 Hz are allowed.
>
> In fact, although you look up this clock frequency in DT, I see
> nothing that actually is affected by this value.  I.e., no I2C
> bus frequency changes, regardless of what frequency you specify.
> The only place the clock_freq field is used is in calculating
> the timeout for a transfer.
>
> So two things:
> - My guess is that you are relying on whatever frequency the
>   hardware already is using, and maybe that's 400000 Hz.
>   That's fine, though at some point it should be more
>   directly controlled (set somehow).
> - Since you don't actually support any other frequency,
>   drop this "clock-frequency" feature for now, and add it
>   when you're ready to actually support it.
>
> And I might be wrong about this, but I don't think your
> (new) DTS binding should specify behavior that is not
> supported by the driver.
>
>                     -Alex

I will support standard mode in next version.

We just need to modify the function `spacemit_i2c_init`.

>
>> +        dev_warn(dev, "unsupport clock frequency: %d, default: 400000",
>> i2c->clock_freq);
>> +        i2c->clock_freq = 400000;
>> +    }
>> +
>> +    i2c->dev = &pdev->dev;
>> +
>> +    i2c->base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(i2c->base))
>> +        return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
>> +
>> +    i2c->irq = platform_get_irq(pdev, 0);
>> +    if (i2c->irq < 0)
>> +        return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>> +
>> +    ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
>> +                   IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to request irq");
>> +
>> +    disable_irq(i2c->irq);
>> +
>> +    clk = devm_clk_get_enabled(dev, "apb");
>> +    if (IS_ERR(clk))
>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable apb clock");
>> +
>> +    clk = devm_clk_get_enabled(dev, "twsi");
>> +    if (IS_ERR(clk))
>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable twsi clock");
>> +
>> +    i2c_set_adapdata(&i2c->adapt, i2c);
>> +    i2c->adapt.owner = THIS_MODULE;
>> +    i2c->adapt.algo = &spacemit_i2c_algo;
>> +    i2c->adapt.dev.parent = i2c->dev;
>> +    i2c->adapt.nr = pdev->id;
>> +
>> +    i2c->adapt.dev.of_node = of_node;
>> +    i2c->adapt.algo_data = i2c;
>> +
>> +    strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
>> +
>> +    init_completion(&i2c->complete);
>> +
>> +    platform_set_drvdata(pdev, i2c);
>> +
>> +    ret = i2c_add_numbered_adapter(&i2c->adapt);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
>> +
>> +    return 0;
>> +}
>> +
>> +static void spacemit_i2c_remove(struct platform_device *pdev)
>> +{
>> +    struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
>> +
>> +    i2c_del_adapter(&i2c->adapt);
>> +}
>> +
>> +static const struct of_device_id spacemit_i2c_of_match[] = {
>> +    { .compatible = "spacemit,k1-i2c", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
>> +
>> +static struct platform_driver spacemit_i2c_driver = {
>> +    .probe = spacemit_i2c_probe,
>> +    .remove = spacemit_i2c_remove,
>> +    .driver = {
>> +        .name = "i2c-k1",
>> +        .of_match_table = spacemit_i2c_of_match,
>> +    },
>> +};
>> +module_platform_driver(spacemit_i2c_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
>>
>
-- 
Troy Mitchell

