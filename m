Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535CC23D7C5
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767001873; cv=none; b=Pm0lkSSidP8RSgabndFXFjM0xtA/+IE3qI8IK38VwiadUWiTYeXtqQU21vMellMNnDKGGZfUsZDGpyOlI+wQWY08V9ra8A6VYBt9ft68iVdLvNZwCVRpcWz0pV5TQL1OWX9g30KzD8BDeTxAChCfj1yyg7EOwCcZcxr80q22T10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767001873; c=relaxed/simple;
	bh=S53nliDgDOBHyCHqekaIZd1yAS6cSB9PJP72bbGyW38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uM3soy0C3eRR/7bOxSvwsPF3aRz30l11/pXbyVQ4uzqcKhMYnzONskooyB8BBKHVtk9e0ZD0yg7HQWVy50OVaq0iV2dJAvl1efmfmGb6gkS1NrOYckgLlf652b1DZ1jqFAwDMQhajhKffHeMFtFCDf/5LeHTQL/domlz5InKMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eIyoXvOy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eIyoXvOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767001871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBpgnCdgVjRyDFiA5DhH+bRquSZr5l4Vq9ipoB5aYAg=;
	b=eIyoXvOyqxL+FHqaNAI+11yiYlVfSXtt4Z0Jeyp3sztmakVSa7525CrttXNTY0PvJLGX9V
	CPDPS4Kuo5AZhY9Rngwfkt1yAZ8OHWDGCVD6UA7lhkGRzCwaLcKLx5mMc0Rzm5Ah6UCXgC
	KA3Owx/tIOxSmDYDJatb0hiIwwVg/VU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-b89PB6VCM8i2nhvt1AKBSg-1; Mon, 29 Dec 2025 04:51:07 -0500
X-MC-Unique: b89PB6VCM8i2nhvt1AKBSg-1
X-Mimecast-MFC-AGG-ID: b89PB6VCM8i2nhvt1AKBSg_1767001866
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4327778efa9so2065880f8f.2
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767001866; x=1767606666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBpgnCdgVjRyDFiA5DhH+bRquSZr5l4Vq9ipoB5aYAg=;
        b=Y/ygDNG6/Jhkp3HqxvFsYtN65upz5bRvc4bM2VDDooxb9Yzxmd3e7qv75LmRmtm801
         RxNoLmlgr1kRtE2eiWyHAqRzCyFwSm/09FOwgKmsockmPlnp5L6WS6mU3X5ePtFsBQ92
         WFcQdC5qRx9+qfnkJ0VBwpn9w58q40HfuMxsLikShKCt0kxoo/+tgMqgLZebohq1Akav
         +wtWl+GA5rSPytIF2Eg+ENNozoJuKo8R0hPW8Jz6YGpPLLI9i2KJIxBtn0zRcRTP1DM6
         Mpr0MwL61FgPPHZEx10atA625ILImTASXNitAe2qgbxK5TPPB0VFShY8718uB7nIdp3A
         FeCw==
X-Forwarded-Encrypted: i=1; AJvYcCWC0y6mb2xpj0Yh7o9YFil4OcvsFYA8BPCMe8OuCi9XFu1dwDf7j7wSzmW8JiT0eHeoQ8kG+TbsdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiGLP7UNTqQ6B8MRx4137sA7VU/iW+TTm2wVvRgllt2JUkLO62
	1qbb7IPZop0SsYQ27q5laHT5EHb+DLriwmXF+Wvfhdryt6NY0eumc085CC2EBvCWUrslsqbCXAs
	D9T5ezXg9rI5vR3xwXlNvPRWaOtI89w17r7nd+V/8kxrfXR8zK6n9vw4fB2+j
X-Gm-Gg: AY/fxX5XcyOONYRFQdfF08v6HB8UBhWCmzqVNMqbDt08RXlVr6D1Y1kpEip0X7dGEkl
	i9ykZqUCRbilUoPcImvho5GX6urjDUosR2oWh/exSBHtNVoXnSXiEH8t9RH7HapC0CL4oRbMctA
	XTE1kDC94GWdVMEgZpOL0zsjltR5PzwYFfiUD51UaqHZv7jRGwItjAHdw88qBs72fcY1M8fsqRD
	9PVFP/+DvUoWnVN/tflB9X0lAfWSNC/BngwBZwjoPTAgti4dJPFN9xMtLw5qf12SCtSh56T4C2u
	YR4eIBYyfMG3Cul0a8u0sryaueAhReot84hxE6TwHeldqzl9ESRz/GW79BNVfxZrimskoocPt1Y
	1J8SpoJ9QRliRnClM+qjYIWYsEkowh0VSfmURHF5H4PBQdOyiA0C3R97HhxUp3cfmGQCY
X-Received: by 2002:a5d:5f87:0:b0:431:a50:6e9b with SMTP id ffacd0b85a97d-4324e4fce39mr33803695f8f.37.1767001866446;
        Mon, 29 Dec 2025 01:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6G1jWYskSgvaXeS09XPL1OAXa1myU5ovRIkOqfBW3h9fMcLnWjubhvT9bqt7kVVsnsSU5PA==
X-Received: by 2002:a5d:5f87:0:b0:431:a50:6e9b with SMTP id ffacd0b85a97d-4324e4fce39mr33803665f8f.37.1767001866019;
        Mon, 29 Dec 2025 01:51:06 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm59086626f8f.23.2025.12.29.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:51:04 -0800 (PST)
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
Subject: Re: [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:51:03 +0100
Message-ID: <878qelhb08.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tybl6itneVss8J7KMZmxjTQIJKhUXjyrL-Omb6gqlbM_1767001866
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> This series try to add reset support explicitly to SpacemiT SDHCI controller.
> Previous it works well for eMMC due to it's already initialized at brom or
> bootloader phase.
>   The controller has two reset lines, one connect to AXI bus which shared by
> all controllers, while another one connect to individual controller separately.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

