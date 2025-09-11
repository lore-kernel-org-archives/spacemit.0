Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA8261B71
	for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757620246; cv=none; b=GR8Rpk3WE2+GaewnpKxq3pCHZ+QXGldkTdZcxJUtSpKOztYWYeVrhzQcKyNt+Tp9Tsv3JEoAfOx/L41pqNsZL+RVwoHZwLbLFbWeByR2MBSDorPMREncC4CX8b9Aks4EEOIBuLMg0pWDyZO2eHa0UeFoUOwWEKKyTcbYGimRrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757620246; c=relaxed/simple;
	bh=kjGxb0dqWe7yMsPMZAV2sViKlRrgFATmcxKdL62xjMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgPnYUrNIK6JzGYgOIP7RquRC3PONxAvzwxsIOg193+hR+m8p9HPLWIjPmlciIpbG8cXmKp509twa1uw8gVLyZjCRiELkp4S4vf+m1g94SUZvlIJ86ywYPQ8H9ma2/UdL386byL1vCfraAJNY/bKJH7SgL1hkDAmvBZTPFniREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeHPxZDA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeHPxZDA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-25221fa3c9bso17574595ad.0
        for <spacemit@lists.linux.dev>; Thu, 11 Sep 2025 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620244; x=1758225044; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=SeHPxZDAsJC/GOxvs1dVYipioq1S1/8piguFhQdigWE7SzJIM9saRMSWhlsqr/XcyY
         BmWdw2coXsgPCd7JLou+VgiPQrstKdkWLbjsKca72jIc6K+u3xECNojSTy03uNJzd/9R
         FJRVOXvrHOD9QLT1BQFu4WXKfrTmqi9o5VTHx+HWyLVGKvm7655RgzYQlVeim+GiWj+f
         uo+dilCK+yHmwSEkXqUA67h68zBby8RqSnI5mLZDzokAGvTILkoVpHjLvJ7c3BEKwODk
         SfQA1qMMw4UqgjFu3i5CsBwoL1gxHy0sy0OYORCzwpjbQCdkRBz6aY/i1PIwHsvBEWbM
         IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620244; x=1758225044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=JOe4gKvK3cZvXiEcSG+FmyEPjnWfMGsVhBeKqdfRavcMjcoa9KPftGMfDiBWN/C0Ni
         xTfy8IR87NEG+5Al/ehK/DvyhWaDGpe7h/Ifd/0kr20SLYLdKzocZzZgSloWyN4PsDag
         q4Wr/V63aRcynHQMWaooH/Zqp5hSzQhTTV+7C5nXvzY9tsmlphq6ihN1Z+MjcuOmfo+8
         qfjMTtE0W9UJkEgegLhdjONp0eAgoMRcAi5s4ftRjjzCxjPt6c0EvZ0Fupw9p9+yvue/
         qDWnG7Vd5pG8DMYCPNZ4IaV79kmf8heD0iv6NfvwXkd3KcAsCbOv338zFFlemM09IGEG
         enXg==
X-Forwarded-Encrypted: i=1; AJvYcCU/wJboGsIwQPlhDvOLGFHkVlwUs2+nqcfzw3L66blkbCaSedzblNdxOcTmR4gkkaG0ClXP7d/IEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5UhwECJVtQu0clG2TxUjRXhFnQBbdiSVJETgVyCfGWxg7hMZ2
	ErTROT0daAm1Ih3+D/4193o2UopDqWZ4cLhd86pkUl7umnM8adsglecm
X-Gm-Gg: ASbGncspF19V4HyHYdh0g4Zi5sEcQug9KpRQ9faozMbvneIwS4qnBh5ZumMjtx/fOS9
	ye6TGsFjzOwj7Xny/ATL8OFfCnJhhg4lFwdx5UdEmz1uNYOdlB+NFxXQQiyOb8LWqFkHJUqiuz8
	ICJU3gS/p1p16RNjm3IdLJpr62mE6gOJC1Nb39IIirDjccISot+NYn2K2LnBUL524wOTQ73UTyI
	5qgyBd9uVYjTnrjKg/LkdceZ0AoDc8ZbILA2v2bhNyRlG8R9TF2yHePu0jiMMtNdCwTeS35kGBH
	nKZ11/QXx3Dj3GX15OhJgH4i38eXlfCJwuhfLO1OqqwAZJWKf7mRSkNQlDiZifjxq19i1HSD9jc
	D+bcWLjddUjzwNS9y7r/8i2JqC5T1NvgZ5+UXBbo11aCTujZh
X-Google-Smtp-Source: AGHT+IGM3HY9cYe0k8sf5GxMMVgG9l2ykvqk4n7ayiGGr2GhLio6Ij8ygJsJDwHZ88T4ZvBeMdpxjA==
X-Received: by 2002:a17:902:d506:b0:25c:9084:4172 with SMTP id d9443c01a7336-25c908466d3mr25755745ad.14.1757620243626;
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Received: from [10.69.47.143] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53bcsm26957775ad.28.2025.09.11.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Message-ID: <cfe7bc19-763f-4e92-b1ae-355c661bcc19@gmail.com>
Date: Thu, 11 Sep 2025 12:50:47 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/2025 12:56 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:
>>
>>>
>>> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>>>                 * be retained from S5 cold boot
>>>                 */
>>>                need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
>>> -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
>>> +             gpio_generic_write_reg(&bank->chip,
>>> +                                    reg_base + GIO_MASK(bank->id), 0);
>>>
>>>                err = gpiochip_add_data(gc, bank);
>>>                if (err) {
>>>
>> I suppose I'm OK with all of this, but I'm just curious about the longer
>> term plans for the member accesses. Is there an intent to have helpers
>> for things like?:
>> chip.gc.offset
>> chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.
> 
> Bart
Ok, so assuming struct gpio_chip is sticking around long term that makes 
sense to me.

Thanks!

Acked-by: Doug Berger <opendmb@gmail.com>
