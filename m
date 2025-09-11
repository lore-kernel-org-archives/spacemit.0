Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0229A1
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757549491; cv=none; b=XmDVU27TwpXmS8EXXYcAaOBJP/z3/NToCCWOycjFgV5a6PujSdoeCeYOmRVS4nI8/HriTEzrwbu0NhocdGMBPsb50Fx/FM5YrHm/KRHOAzCu+oN8l4TfeHa4OXdJ3jtXZSXY9VmU1bMGBED2GI1Mpu58OSK0fUl1xhpARw6DBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757549491; c=relaxed/simple;
	bh=7IZsjcVMn98TUCGCmrzXEkg78zYlAtjziIZcrjFxEPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0bVauABpCOZJgJjNo752GXzPeiOG3R1SNF5tNUpTOcF7dGvROKOFNpfN5Q29sCJXi+z/80au7x+RSnXEa6WNOzuZ3Qu4AaoBQCYaCLfkXmQr+u5dselTgih2uRQ+CIYkaabt6edRMKw6Yf183rPrm1J70FEHS+ZJBpy3slEieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGxfA55S; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGxfA55S"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so117144a91.2
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757549488; x=1758154288; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DprGrl9e7Kz/gK4ZQarAvFpOQC1FXR4i36X1x0X3X4=;
        b=XGxfA55Sd+a7ole1k/7XvxyAadZzWNcR/03pdE6IERrkvGDw7n477WW1AFtaoNeiNc
         0uNAcjdMIMYomoil91s/2qlx73HDoDoY0hxBN6pJZog8cbcHsPCcqk9t+Kj47fc3Y/1t
         XYiWtjx4CQNmNJ09vaxVNKSi1YY5wEEDVv4RmP0gvC3CbcKWhuGgjS6s6dampXzrkC8l
         Aui5p6Jf6vwkxPur+bK7dbOTauj9TJZ6ibpTpzlkDXENX9ZUKDkh9oKiYL8Z6xxaAuON
         dXAh2f3da1qBuqrSk79mx6SMXh8khL4eO1pe+2m/F946hJqUT5PXA9l+3CYGYxgxyJVu
         +q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757549488; x=1758154288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DprGrl9e7Kz/gK4ZQarAvFpOQC1FXR4i36X1x0X3X4=;
        b=osizUBHYjXn+y8xRvWnI4kEu9nzD66DIHtG5Nuq5o3xUg5bqAU+1HIH0vhvjakL6si
         5KaSianx2ZQLuNzgZEXhmXZJCTu80YrczVicPaHDbQuJQSREdcY91bgMrqKggASyHTVR
         HJsuM7kgljO+ZzxZT4KD8lZ+EVTavdz2oMcu9juWVWqudc5ajN4U0WtrWtbA4pUJmVhO
         i6pq2JYJHtoWFc35gNVYahqSFPOZuATbbxXVibo1LN5BBUISvUFWDzwgGuOzfwdnvAh6
         LwgAeDVyx8JeWWIZFMppASqH6PSe+KEZUQ2d2qyZR32dPZPuryiAPDvia//ipIHrxVHz
         JP2w==
X-Forwarded-Encrypted: i=1; AJvYcCWly7rQdU5iTTJH3TahqhdNXILhPR8REpa1kLyjH+5ndoHwYDDYRtn4mehUbFcDEsLOeQlecPDKyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxeP0rUqbyaYMOsg7fh/VE/dmm12T9BrFW/gip1z2+6uLqxx4G
	JMVcgIRBPflKlACSV3H/S1+C5zFTNDF58yHte7k6dAB42PB9z+cHDL3X
X-Gm-Gg: ASbGncvTIG9eJgmf7OIf/F/TFt8LpB/qZlhamT3DLW8PSko/Ig5bqNc3JEEMyDTMklu
	lGyA+C1CexnBDYgWKdJ/sxtOrSWyA92aQhSqzafUOgZ5m9McGcmhTqyEiW/0WpgGKzPwTYm/qEf
	8z4S6BkT+iW8NWgxD4iiGncqClERx05aB+c8mcOCynLVrUcfOXke7vOMQ7MM72wW+05a9/6hgkL
	1vPb3CxKk+utPAT1dNEaA8CBcHDAjVzmfM4TarcK+NFre5/HTFSPi15n3JKxAmFrn7uhbBNAg5O
	DdKtaqVMya1MmnmbjAD7MlkNSVuaZSRKmGlYQKwg4xxo4r+vAJjAlTAHNfSA1bDvXa3FHx+DxKa
	ex5u6Sp7ewovqhsJPjY0HOIC/6jPIt+ob4KkV1LPZCLQ1e19U/g==
X-Google-Smtp-Source: AGHT+IGh6jj8tUAVO4xZEgg1cYXyd1dv7OFPe+9zkElp63vXFZLpgGfDXrx3xfdSlohQ5ds3u2EMGg==
X-Received: by 2002:a17:90b:52c4:b0:32b:b26e:156f with SMTP id 98e67ed59e1d1-32d440d9ce7mr23339735a91.33.1757549487838;
        Wed, 10 Sep 2025 17:11:27 -0700 (PDT)
Received: from [10.229.36.175] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd632692bsm437067a91.25.2025.09.10.17.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:11:27 -0700 (PDT)
Message-ID: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
Date: Wed, 10 Sep 2025 17:11:26 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/2025 12:12 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 112 ++++++++++++++++++++++++--------------------
>   1 file changed, 60 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index e29a9589b3ccbd17d10f6671088dca3e76537927..be3ff916e134a674d3e1d334a7d431b7ad767a33 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -3,6 +3,7 @@
>   
>   #include <linux/bitops.h>
>   #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/irqdomain.h>
> @@ -37,7 +38,7 @@ enum gio_reg_index {
>   struct brcmstb_gpio_bank {
>   	struct list_head node;
>   	int id;
> -	struct gpio_chip gc;
> +	struct gpio_generic_chip chip;
>   	struct brcmstb_gpio_priv *parent_priv;
>   	u32 width;
>   	u32 wake_active;
> @@ -72,19 +73,18 @@ __brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   {
>   	void __iomem *reg_base = bank->parent_priv->reg_base;
>   
> -	return bank->gc.read_reg(reg_base + GIO_STAT(bank->id)) &
> -	       bank->gc.read_reg(reg_base + GIO_MASK(bank->id));
> +	return gpio_generic_read_reg(&bank->chip, reg_base + GIO_STAT(bank->id)) &
> +	       gpio_generic_read_reg(&bank->chip, reg_base + GIO_MASK(bank->id));
>   }
>   
>   static unsigned long
>   brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   {
>   	unsigned long status;
> -	unsigned long flags;
>   
> -	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
> +
>   	status = __brcmstb_gpio_get_active_irqs(bank);
> -	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>   
>   	return status;
>   }
> @@ -92,26 +92,26 @@ brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
>   static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
>   					struct brcmstb_gpio_bank *bank)
>   {
> -	return hwirq - bank->gc.offset;
> +	return hwirq - bank->chip.gc.offset;
>   }
>   
>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>   		unsigned int hwirq, bool enable)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
>   	u32 imask;
> -	unsigned long flags;
>   
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
> +
> +	imask = gpio_generic_read_reg(&bank->chip,
> +				      priv->reg_base + GIO_MASK(bank->id));
>   	if (enable)
>   		imask |= mask;
>   	else
>   		imask &= ~mask;
> -	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_MASK(bank->id), imask);
>   }
>   
>   static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> @@ -150,7 +150,8 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
>   
> -	gc->write_reg(priv->reg_base + GIO_STAT(bank->id), mask);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_STAT(bank->id), mask);
>   }
>   
>   static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> @@ -162,7 +163,6 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	u32 edge_insensitive, iedge_insensitive;
>   	u32 edge_config, iedge_config;
>   	u32 level, ilevel;
> -	unsigned long flags;
>   
>   	switch (type) {
>   	case IRQ_TYPE_LEVEL_LOW:
> @@ -194,23 +194,25 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   		return -EINVAL;
>   	}
>   
> -	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&bank->chip);
>   
> -	iedge_config = bank->gc.read_reg(priv->reg_base +
> -			GIO_EC(bank->id)) & ~mask;
> -	iedge_insensitive = bank->gc.read_reg(priv->reg_base +
> -			GIO_EI(bank->id)) & ~mask;
> -	ilevel = bank->gc.read_reg(priv->reg_base +
> -			GIO_LEVEL(bank->id)) & ~mask;
> +	iedge_config = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_EC(bank->id)) & ~mask;
> +	iedge_insensitive = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_EI(bank->id)) & ~mask;
> +	ilevel = gpio_generic_read_reg(&bank->chip,
> +				priv->reg_base + GIO_LEVEL(bank->id)) & ~mask;
>   
> -	bank->gc.write_reg(priv->reg_base + GIO_EC(bank->id),
> -			iedge_config | edge_config);
> -	bank->gc.write_reg(priv->reg_base + GIO_EI(bank->id),
> -			iedge_insensitive | edge_insensitive);
> -	bank->gc.write_reg(priv->reg_base + GIO_LEVEL(bank->id),
> -			ilevel | level);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_EC(bank->id),
> +			       iedge_config | edge_config);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_EI(bank->id),
> +			       iedge_insensitive | edge_insensitive);
> +	gpio_generic_write_reg(&bank->chip,
> +			       priv->reg_base + GIO_LEVEL(bank->id),
> +			       ilevel | level);
>   
> -	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>   	return 0;
>   }
>   
> @@ -263,7 +265,7 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
>   {
>   	struct brcmstb_gpio_priv *priv = bank->parent_priv;
>   	struct irq_domain *domain = priv->irq_domain;
> -	int hwbase = bank->gc.offset;
> +	int hwbase = bank->chip.gc.offset;
>   	unsigned long status;
>   
>   	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
> @@ -303,7 +305,7 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
>   
>   	/* banks are in descending order */
>   	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
> -		i += bank->gc.ngpio;
> +		i += bank->chip.gc.ngpio;
>   		if (hwirq < i)
>   			return bank;
>   	}
> @@ -332,7 +334,7 @@ static int brcmstb_gpio_irq_map(struct irq_domain *d, unsigned int irq,
>   
>   	dev_dbg(&pdev->dev, "Mapping irq %d for gpio line %d (bank %d)\n",
>   		irq, (int)hwirq, bank->id);
> -	ret = irq_set_chip_data(irq, &bank->gc);
> +	ret = irq_set_chip_data(irq, &bank->chip.gc);
>   	if (ret < 0)
>   		return ret;
>   	irq_set_lockdep_class(irq, &brcmstb_gpio_irq_lock_class,
> @@ -394,7 +396,7 @@ static void brcmstb_gpio_remove(struct platform_device *pdev)
>   	 * more important to actually perform all of the steps.
>   	 */
>   	list_for_each_entry(bank, &priv->bank_list, node)
> -		gpiochip_remove(&bank->gc);
> +		gpiochip_remove(&bank->chip.gc);
>   }
>   
>   static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
> @@ -412,7 +414,7 @@ static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
>   	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
>   		return -EINVAL;
>   
> -	offset = gpiospec->args[0] - bank->gc.offset;
> +	offset = gpiospec->args[0] - bank->chip.gc.offset;
>   	if (offset >= gc->ngpio || offset < 0)
>   		return -EINVAL;
>   
> @@ -493,19 +495,17 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
>   static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
>   				   struct brcmstb_gpio_bank *bank)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	unsigned int i;
>   
>   	for (i = 0; i < GIO_REG_STAT; i++)
> -		bank->saved_regs[i] = gc->read_reg(priv->reg_base +
> -						   GIO_BANK_OFF(bank->id, i));
> +		bank->saved_regs[i] = gpio_generic_read_reg(&bank->chip,
> +					priv->reg_base + GIO_BANK_OFF(bank->id, i));
>   }
>   
>   static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   {
>   	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
>   	struct brcmstb_gpio_bank *bank;
> -	struct gpio_chip *gc;
>   	u32 imask;
>   
>   	/* disable non-wake interrupt */
> @@ -513,8 +513,6 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   		disable_irq(priv->parent_irq);
>   
>   	list_for_each_entry(bank, &priv->bank_list, node) {
> -		gc = &bank->gc;
> -
>   		if (save)
>   			brcmstb_gpio_bank_save(priv, bank);
>   
> @@ -523,8 +521,9 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
>   			imask = bank->wake_active;
>   		else
>   			imask = 0;
> -		gc->write_reg(priv->reg_base + GIO_MASK(bank->id),
> -			       imask);
> +		gpio_generic_write_reg(&bank->chip,
> +				       priv->reg_base + GIO_MASK(bank->id),
> +				       imask);
>   	}
>   }
>   
> @@ -538,12 +537,12 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>   static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>   				      struct brcmstb_gpio_bank *bank)
>   {
> -	struct gpio_chip *gc = &bank->gc;
>   	unsigned int i;
>   
>   	for (i = 0; i < GIO_REG_STAT; i++)
> -		gc->write_reg(priv->reg_base + GIO_BANK_OFF(bank->id, i),
> -			      bank->saved_regs[i]);
> +		gpio_generic_write_reg(&bank->chip,
> +				       priv->reg_base + GIO_BANK_OFF(bank->id, i),
> +				       bank->saved_regs[i]);
>   }
>   
>   static int brcmstb_gpio_suspend(struct device *dev)
> @@ -585,6 +584,7 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
>   
>   static int brcmstb_gpio_probe(struct platform_device *pdev)
>   {
> +	struct gpio_generic_chip_config config;
>   	struct device *dev = &pdev->dev;
>   	struct device_node *np = dev->of_node;
>   	void __iomem *reg_base;
> @@ -665,17 +665,24 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>   			bank->width = bank_width;
>   		}
>   
> +		gc = &bank->chip.gc;
> +
>   		/*
>   		 * Regs are 4 bytes wide, have data reg, no set/clear regs,
>   		 * and direction bits have 0 = output and 1 = input
>   		 */
> -		gc = &bank->gc;
> -		err = bgpio_init(gc, dev, 4,
> -				reg_base + GIO_DATA(bank->id),
> -				NULL, NULL, NULL,
> -				reg_base + GIO_IODIR(bank->id), flags);
> +
> +		config = (struct gpio_generic_chip_config) {
> +			.dev = dev,
> +			.sz = 4,
> +			.dat = reg_base + GIO_DATA(bank->id),
> +			.dirin = reg_base + GIO_IODIR(bank->id),
> +			.flags = flags,
> +		};
> +
> +		err = gpio_generic_chip_init(&bank->chip, &config);
>   		if (err) {
> -			dev_err(dev, "bgpio_init() failed\n");
> +			dev_err(dev, "failed to initialize generic GPIO chip\n");
>   			goto fail;
>   		}
>   
> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>   		 * be retained from S5 cold boot
>   		 */
>   		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
> -		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
> +		gpio_generic_write_reg(&bank->chip,
> +				       reg_base + GIO_MASK(bank->id), 0);
>   
>   		err = gpiochip_add_data(gc, bank);
>   		if (err) {
> 
I suppose I'm OK with all of this, but I'm just curious about the longer 
term plans for the member accesses. Is there an intent to have helpers 
for things like?:
chip.gc.offset
chip.gc.ngpio

Thanks,
     Doug
