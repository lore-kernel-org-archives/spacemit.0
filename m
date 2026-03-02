Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BA83876D2
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440680; cv=none; b=lIRpTmRqbHCOG82+mqjiWlwvlVrmzNywJ8x0lplxlM+i2i/DtrmG28Ovr15J3jpZLpNcekExj+YbSfq1y8gGJ04i+B5fR+Nub7pbnK9mJLaYU1aA7/UEshSZrarsivTQVFzu4+uRMOS5dETrdz59opg4Jr1hN/mf9HF6NEi/cGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440680; c=relaxed/simple;
	bh=gZsKGliAWUqfmyK0ymwLDcsrfvLvemojG4uLqBwLm4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZIiL4WsC8V5LHOVN9bRLLvIE2H7cT+LZO65wjdXMbUN2Jr6MxTCrlCg4M9iRshZ3VpM7oxQpyVPZASKMjM5wXbqWU+cuygJylbt5mocyY4g1g6GxVfc/i7Jpu/fO6YSgd4AI3bjCw04XG8xC/WdaM9PbuipyWZVU+V13FSfClo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4S4vQvW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4S4vQvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772440676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdiPWtYWuhb9fL37CazwRyCdnnWG5JaBkwTXBZF0Kdc=;
	b=M4S4vQvWnuHDK9uBo47mbwxqFPWMUnCSNsQ8AW+W+Aq5dmS7Gto1DH/9j3Tjflm7hCnRyE
	bhinBkzQvQxM3Zri97sBNr5H5+3EclTyxGThHn7F/4hgWKgm0Jy8E1Gcb1WVqL7qZsq3nC
	Cssf90JVNMYf8xVJNo8Nj3is+ZzZ4eI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-mlSG7KABPUeT1MHBHWsnqA-1; Mon, 02 Mar 2026 03:37:54 -0500
X-MC-Unique: mlSG7KABPUeT1MHBHWsnqA-1
X-Mimecast-MFC-AGG-ID: mlSG7KABPUeT1MHBHWsnqA_1772440673
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4398fed3552so3501981f8f.3
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 00:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440673; x=1773045473;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdiPWtYWuhb9fL37CazwRyCdnnWG5JaBkwTXBZF0Kdc=;
        b=e/6jYQezOkFVZrMY93CCWOIOjtxB8LnpPXSVCLsHNh8zeYx0ZSSwWBxRZFas+0TVEU
         +1sdB7bYfo+51e41v1L4FrDpfoNV5uM7nVGMgGW84lDdNuzTG9ftIqD73mkqgbSlMDHm
         1i+qLdYAKT/1OD4hk1zLhSNg/OFJJLULMdo0Vj1iFmX+qR7/dfsC8mY24W2L0ZPApOZI
         DN9vmZUkVmUfQ0hVYXgdQMMkJHclMicsx/KMlHPlmJDyvVbHBgr5z3fLi0tTC3H/4/zS
         Rum2nNF1PFhM1uuYF7arF2TEmXhUAnj5yYzMSyuZIONahOy3I9f+xNU6uBG3J4Aq9hQg
         XJKA==
X-Forwarded-Encrypted: i=1; AJvYcCXbrQR+ZOMo1b+zH6uNx9cUAkDIf4GxRn3XCGo7cp1DMuxOxECRFFB2cnvTUQoy9ney9kWxbJHPHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO9rVoi4dD/kzeneDupCId6pA5MZVECd7tPvzVVMr5sJX54LiF
	J/F/3NOVowvzl4lgln1pcQxdtxRvZyBiyXJrNQiamduOcIuLCSedtiFb78VGY249tDeEnTOR+JI
	SxHUxR9jr7sr8TTc/5d2NRagI4esAjjlMXj+rW4jUUWXiA14JiihNbczBeWgw
X-Gm-Gg: ATEYQzwLHUUC4iS9aVnQekWc2ANcQV946wr5Z6p36NADsi81/QEXJgyGb9bB6gS1jYa
	txz6WvPhGzgM41vQvm/8B20P8a9DCdvAKnB4aJ7K0uBDBdvLGxwjuQ1vG+XnF5vfTzHv1iboD8j
	dm1Qls73O5FEWSMsg0bcyiSZXpAPTngvMfBP9uKbwiAhBgFmsMY8+/+pl2qXrmWYwJldTiN3a0d
	F3fhK0U6dFrPd+a6jBay+Db8T7rvq5eGGvIIFlCH7veqBI8jcbvDqwl/H8cVU2I8f6Ufygj6k9H
	UhEVHDw3qgClpYIxI8a1k2888Bg/r3dPckU3VaaujipMVT64ExjnqykR+dMtqLv9IKMhfqfhDMo
	FnUtz2dtkpngOuMvESz8LNF7uBij6aHEW7y5IuKVuEbhL7Xddcf88ANJwaIbH6qB4DVqO1IS0m0
	m7qMS55AkcDMae
X-Received: by 2002:a05:600c:8b30:b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483c9c0e31amr187765785e9.29.1772440673356;
        Mon, 02 Mar 2026 00:37:53 -0800 (PST)
X-Received: by 2002:a05:600c:8b30:b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483c9c0e31amr187765305e9.29.1772440672920;
        Mon, 02 Mar 2026 00:37:52 -0800 (PST)
Received: from localhost (220.pool95-22-156.dynamic.orange.es. [95.22.156.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm15077496f8f.5.2026.03.02.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:37:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
In-Reply-To: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
Date: Mon, 02 Mar 2026 09:37:50 +0100
Message-ID: <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Ii7-lP9FH2Uxhdub5K0sWw1NKUFAc6qA5zwDT18D1E_1772440673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@kernel.org> writes:

> The preferred node name for fixed-regulators has changed to pattern [1]:
>  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>
> Adjust all SpacemiT DT regulator node names to fix this.
>
> Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
> has preferred node names [1], so let's change it now.
>
> This isn't strictly a bug, so I've not added the Fixes tag.
>
> Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
>

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

