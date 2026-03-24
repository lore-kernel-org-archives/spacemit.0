Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84D362136
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339361; cv=none; b=kQIDC+LjlyWiGoLKL3EHzzPnx9rgJG/Y0tkX5oxc7sVn2fM06ePtSYgkfGFNPYS7SqxLjXDIxcd0+xXV79y0brBroL4rxZj+pMRbOB58v77+mpWrwFD4POnOKNjp4f2AL0GSxA+CdDjDxg1jFxpx5PNpFZldFMgih457mfucbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339361; c=relaxed/simple;
	bh=Pz21v89mgKvxDDXEm4UmGj7tuc5PFErBer+IwkrrpBU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=an/oHexd9kAuBQPuAwpTamE42fo1w860tzmWLjEC2tbaN0Llhn80SrQ/lVxMxEQRV8GB6dR8Ad6pcRHUxQm1f7pMIsmSRUvW4X7RH9m/gHoYfqavvk5J9Bl3XZhoQIcMepEOT8ULKW64V0Zb7xILw6cF5r4fCDwINdcZMRHe7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffRjdtZY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffRjdtZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
	b=ffRjdtZYaRYb+UOrT6usN5PccmXFvVFJCMfphjOjpjj6C5XU1Oy7bIxOi6UyULBBhNOKeT
	N+tBsmG6Uw65nbBbnhBWMRekrbiyd0HXjFq1CVWSeV7OVGWv6njcU81KVyNcyi1CbdV28U
	8IUfOQvmpC3SgFPQY8p9y6LSlMi7LjU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-fPBo9zTkNlCNPRrc6RDGdg-1; Tue, 24 Mar 2026 04:02:31 -0400
X-MC-Unique: fPBo9zTkNlCNPRrc6RDGdg-1
X-Mimecast-MFC-AGG-ID: fPBo9zTkNlCNPRrc6RDGdg_1774339350
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso20508585e9.2
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 01:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339350; x=1774944150;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZkji+aeo/J3L7vBsxBs/MQaHOamVQrNiki5qdjf+wY=;
        b=RK2AI7ue710v/pJFoxH8TcPCs+xrw3a0zhDIJhN9Ptp2lLOPb3BH9sZjroc9mOM5LG
         DXXV0hLsYQ+NPDxOk4k6ZOiANrFqAEzZ2GodFVNCj6mqexR9FBkowLyhtPOYFJei2a43
         /o2l4vQyhTwi9HIomTDekpd5f1mJsypWHdNT5Sqkt8/Mc2wj0EwvmBJJDJx941lsMVck
         iIZ1gHDTR2wwabd7EZ5BBn3i4J342tPy5UvbsNScoCKEQvPV3fOtSwgLxTp/EDqHP/V4
         TkSz1+H4gjDcMsjC3UEoFLU393dlHJ++E9m5kAj3bYfmgm/ayONDNE3J6LLEdOlYvlEy
         xOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpJtgC4eaHtpZ5i2QxMmhdoEEyUDC3QgGl2RA32VETWHqfeU4E2m03igFQLYtO+A7HEKXv/sJnSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEri2+DwSa01CrMdIM6HxUQVLFlMCLGcA/dERBviUEDNqhs4Cv
	nvgjtAWD2Eua9laFcsOVheplMcHP/TORtGvqGYTBbMWnzG4bwcOGPSA6BmtdRmsp2kSeUf0cGZ+
	3QCKjYvr1A8GVaZ11hB7HPOVH3jKxckymuuc+/pGOZ2eP2P9jz/n62VizLI7B
X-Gm-Gg: ATEYQzxEtgGxNQmzQl3AagcumdDnVP8Ruola2VLtpqbr6ahC8S7Od42ZWHcFSoXpTw/
	3mcu/iPnkwyD2r3ZVVLbGViKRYyFRwacGu6wMS7AcM6UE1yBD2X9FrtoNGDqrcSoQopGCwMVCsv
	5ZoaUtq9kZZQ89iJo3MQVhuiDmfrRh4oaYdiRTZpXYRLoZvlb09eKIQSPMPpzMOajUltIEqc22/
	QA2np5t9QvPiA8AGgA6GzM0r2pqEzlRjt0o+62n49aP7jLD/lxSXDG71dQYxdUWP1SITnkmDeeH
	ezslkfx125NQuW/A0lPiy0K3shVqAcpRPQiH865wcMvFz20tNAaLKtDP6Q+F6vpA30qWbDyc+05
	x3ke8sQLAFU1IlvnSyn8FXHXpDLhBqwFgdvr90F0/IMRxOwB/Er3PwV477gyKZ826a3zSdswO3M
	K8xGw9
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978815e9.12.1774339350324;
        Tue, 24 Mar 2026 01:02:30 -0700 (PDT)
X-Received: by 2002:a05:600c:8b32:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-486fedbad16mr202978115e9.12.1774339349760;
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm36915974f8f.17.2026.03.24.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:02:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-7-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:02:28 +0100
Message-ID: <87341p8xkb.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3V0w-u8mUt4zP3_4GpCdNJcJfdU17TtQfXt1KH0My_M_1774339350
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the two PCIe controller along with and their associated PHY. They
> are routed to the M.2 M-key connector and to the the PCIe x8 slot.
>
> Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
> the PCIe ports.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

