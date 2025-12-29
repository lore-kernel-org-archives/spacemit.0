Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C323C4FD
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002162; cv=none; b=T9ccAuhXhCvsNqgRHnf7LbC9EbgUvbOtfeWAyvtfmumMU940kS9PFaM21csPBOyyP6N4MYGlQANk2cT0osjit/yIs1P37Ms69u2bnU+4xJnOj5YGYdTpH91IBQHHxsVJcVDgAcb3hYMAe0YoAU9TgulvKPsVYzwg/qReeV4imGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002162; c=relaxed/simple;
	bh=z0YEap3u/EBh2b6OmtcTMDQvHPeE+nUA6zhZ4RivPS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ulKDKGllBDTxsXGEawkXg7beSkWSyFJ0Blmebagg2w1v+51BwdWdVMyWenpo6CAQ51sd8sb6MzYCx46Pg44g7gTmxHsGVM0RTztieHYWh62T5R+gqJ+W3+lJgfxlgqMyhqj/+Nuyk5UpQI8zDBSJrZQlH3yrB2Z2SVUT7c8w/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFDhKK12; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFDhKK12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767002160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obH9iYXUH7PcM8LuIvRWvOaIIfnfBietKIkzq92XPAw=;
	b=CFDhKK12FnXzdrkGiJykuUe9iFxlzEoEUbC66IBNgNhHnDmTod/lbVxQdiW8npJmZ4UJf/
	0flouEy1TNnbBdb3XDx9HH9zbt0pv2OcDo/62Du13Y6QzkJsgy3eKJi5CCArGJq/jcpTmS
	c08sNLyRV7YLULYeYZJnYSsM9bgFoek=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-_iFWAGkwNUCN4Tfx7sOsoQ-1; Mon, 29 Dec 2025 04:55:58 -0500
X-MC-Unique: _iFWAGkwNUCN4Tfx7sOsoQ-1
X-Mimecast-MFC-AGG-ID: _iFWAGkwNUCN4Tfx7sOsoQ_1767002157
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d3c4468d8so20561015e9.2
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767002157; x=1767606957;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obH9iYXUH7PcM8LuIvRWvOaIIfnfBietKIkzq92XPAw=;
        b=TVWXN2elHgS+nKxsy4XAA10H5zSAqPD3vlgpdeVRGDAcJJWf7N7xnwg7V41+l7m7zz
         ybNKNV/bQk2uykiHp22FCUBHaAk45pHMB/7rm7wGc+aMa+Pmb83wxNzT6GX9CApVxe1p
         8spmcindL/oqxuyR913kF3oeTMYLoGmi/Py6fxQS9ydEs4KzYGQ+YMW1ijjkz5dy09Ua
         y/NN9/RMY+6y+YQr4V1LPEWOiV99+yvYXXt5dwzawwIY/h2BMkLV2mzXX6S4i4hdUGcz
         A3bYkw7spg8vwUTuOt4JSxsCitcN9khD82sdJ73QUv3+C/e3TIpEwgn8ub6CvbPEs9tF
         Qp4w==
X-Forwarded-Encrypted: i=1; AJvYcCWxruhBEsTrzOocbM2gJWBabNaS26M7QKocvyxQkK5ca3nqvgjgl+NEjJpd9w7fwuWe64WXXCwQig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfUqL8uA7n4sFNhRGZM2PBW/vsWhqMKb38G5clSGffRfQSoI3e
	6QBu31mwIepBls2OJtAiNiaUtQRPBNCX04Qh4JkjgrQ4ZpfkEmrBGvhTl0hp/WCoa3Y+3LpUvMV
	UdeOiF0N9SCenHCuogOGN7+ZFHk4uXaJkTjOsIviW3yF5PpXo+z7lL1buUkck
X-Gm-Gg: AY/fxX4quzkV8M+EJapaSsMsTaJ08QgCc+Yw751I4OWVFCPAy+lQYz6sDJGaqBD6ok2
	aoJzRguYCNqKel+7+LSGx+9HCvkJxBkNU64hST5EEqA7oqpKdUxgm0bJyxEd6txRNxFpNtp7Hh9
	t7SFFVptIk0zPURvLeAxkNVpV1QvR7JY3KAuyDVSqMbySkG2ZvIztPB4hu3kieGjx8dTis5cLLR
	wxpqn0JlSon9Tstw/kCxjQ+lvQ/9l8JDxxQKVOYjhGlS2MC/WYYzsmamvx9ZSfEmv7BLMDl35ht
	7ChF4Q2G/aRSnfGWKzVHJNzf9enC2Oam+qxrLKSWIHaZtOPCGMJIWqRpTrHOWbLMYKqqSUjdOzr
	3+TEY51x95QT9Dm/JGyXuFxax+CuT5lmbvqaVtdow5M5ujk7HbzBcbRpqidiH6eUR24B6
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr410001355e9.31.1767002157335;
        Mon, 29 Dec 2025 01:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvt0pHSYFpii6xSHzwFuul+6dVBdHfQqlf/eiF9MlDFn+5XDqtCOM3lJyrho9dCfbqBslcow==
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr410001085e9.31.1767002156889;
        Mon, 29 Dec 2025 01:55:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a33c1csm252799015e9.1.2025.12.29.01.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:55:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: sdhci: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-3-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-3-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:55:54 +0100
Message-ID: <87344thas5.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EOhIH2LbUqdBEkFxzLTqO6TtrbsfATM2pR61UfTKljk_1767002157
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> Request two reset line explicitly for SDHCI controller.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

