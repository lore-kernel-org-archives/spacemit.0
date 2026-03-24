Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7635A3A9
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338990; cv=none; b=J+/MZZxWXJGnAN9v3goDjQNXHNoYhN4b8IJgFQ9zOtLkTUJvMFAe/qHpoZDLUeOjzgImoKG+aWF90dwQ5L0kZ/bSGN1vy2b7RGNSaSwEyQ0VL8J9fZhAXQM+Vc+NmsjqJEChUchKHmT+Nx4U2w4Cm0/WRD5a7TvGijyMRAWwfyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338990; c=relaxed/simple;
	bh=JztfBpnQgaPei1/wTdcWLaVfhzVof/rGEWlo5CNrbpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PncSubdj6sOoZs+UWmcEcyaGNsnNMj8bzuQXP8m90VG8oW9Ot2SIVTMkONhQ9v8btRjF38X0KYow/UNBPSLBkvXHL02Zi4X4ABWCA1EZz97/+nfxVchzkwBqG5bbgN5/K2kpVOEdYM9Z8Xqaf77ZW/TMgAMbCU850tBV4/U4Wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vl3OsENi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vl3OsENi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
	b=Vl3OsENiFDMfGp0eZjjAQsY24tpvskV1dMPzfaCc+lx8pjEECvZrM+9zZ9MAWDy09lSjuS
	dyda95sRC1Xe5BjDl6MNj7xV6NZRyalihpl4xZnPWrfIsGlZwcjdlU/GtdlpC8jQ4g1Gx3
	mpzZVXHIQdC73kuPhLwRCwWIuKAFWk8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-BURf32QcMVCh73rnNwbEMQ-1; Tue, 24 Mar 2026 03:56:17 -0400
X-MC-Unique: BURf32QcMVCh73rnNwbEMQ-1
X-Mimecast-MFC-AGG-ID: BURf32QcMVCh73rnNwbEMQ_1774338976
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-486f89b7f69so35789495e9.0
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 00:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338976; x=1774943776;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znX9TqTQEYE5xEdxh0wdrvjA19dzf/Slp63xVt6ggFY=;
        b=nsdUEuyqOH5iPRwNCokEDAU02wHZNyJe9QiJSJaSr237LhSECNqqO+fqp2amPfuEoB
         gv/a17WevJ+nla7h52zCazHwl9HyCYf7G4T1st+VbNakzyMEyqOM5JN0wO7lrtlsTW0e
         M/t7WW6yqzq8NJRo49IErqNaQ6lNzfOu0IekGvbB2OAQQ483knH0hnkpjItGzlcicfK2
         9pcLl0DQggy5SyX398mmZ55XBZdz+sFXHsCmoE6yk1+GfxE/FwkB8D3Qmc50umteFV+h
         sDqIKnewP11HY6bn8dFMHo78AdNd0Lx/BkzpU++6PVI0pvjx7FPi0RO70QD8AWenvapX
         jvjA==
X-Forwarded-Encrypted: i=1; AJvYcCXad3c0R4FfmbkU2tYH3Szdtq6h8sqe78zQmTwwsle4QzW8vkPtfF05ygNfWXXdKW2AloubCUZAAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf6cGM3Qg72fW/jCCg+65DcL6OhnG/x5UmyeZwNF3avXSHPzrW
	onSLYiLT/Pocn/74XaYbeFarCgPCfy8F8QqkodLvTVsK39zLa23Zfnng0RDTglUDxC8UEG93oD0
	sFgGn3MaRnUBd6Yr32lkl2cz5wR54zqbra9bGbeOUnyVx8M1ngiiTfHraRzib
X-Gm-Gg: ATEYQzzheBiR9jAXkjyHqCrldApdZ9FQ6EBSVriV36lzan3H9oDWZ4fkZBJ5jcoaNoa
	M6hJhzYRG/oO6wxS288fWq8GwkAIldJI1KTB+jlp4o1JUoAtzEzquST2NLR+/i3U5U4opS6BPbp
	uMYdGLiOcbuj7K/iiR3SQdfPIrrIMhak2FcSym6eVjpemk/yZMvgcucA3SkcdfdvGCd/GDklAZ0
	166pjcIfg56SWPu6gvSnZTCZIEdh9mBJP5YukPZdjviDS6sHIFvl3LFYBGEqUvrk4lQ4niBgkgh
	AAxls1amOHTSnQOdFbhB95q9bZbqA1wE4tDepmCD6nty6wIAP+YdTO0STaOuqVJl8eqbxF2elec
	NR7iDpfjUxo2GaBrwmq3JeMfF95tzMbeuxoLRWUewwYK4l9K2bEgdmIVI/y4hq8DGjHpBG8423h
	aEVgi+
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640519f8f.49.1774338976176;
        Tue, 24 Mar 2026 00:56:16 -0700 (PDT)
X-Received: by 2002:a05:6000:184d:b0:43b:5762:2989 with SMTP id ffacd0b85a97d-43b6427b212mr22640483f8f.49.1774338975756;
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34390579f8f.15.2026.03.24.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-4-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-4-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:56:14 +0100
Message-ID: <87cy0t8xup.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0GOJRlryCbQqPoBMJyWE58WidowIy654STxzcphw8Io_1774338976
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
> keep a stable number for the /dev entries after loading the i2c-dev
> module.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

