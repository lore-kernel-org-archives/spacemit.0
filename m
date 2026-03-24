Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B53CE4A9
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339326; cv=none; b=OWI6X2yXFyjuIA/7KnUrSNlrTxYlgp5RdwNFWnSw/PEluaqKMs5RWlwDLqhgmaaOwbsKd+sw5o4yPB3UxW9A+x8isSyp1x7fw3a8vji0prRKoX+FshJnfvmgmQD8EyCMTvNBJ7oyzLBWWosRsT0SQ+mNs07DpSu9MXlN9P1Od5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339326; c=relaxed/simple;
	bh=5SKLbVjvo+BklmZUI0W4Z4Dgtp9azMKMYYOdJ4abq+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ax6rsZNTLVfoccesjNH5Grv+jeN2sVW+QDqpoqKOevSx4fJzf0/fKNuJ/NL//j7EmYYxg4lwLaaqpO1SXtQ+YHqhm0sqWnizymbDYP4VaJD6YXHl1cZNBPxehNxj2vusuSmisz56NvotpJDCERuexcYYHEymWxkpqnt7QRSP8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XaS7RrN2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XaS7RrN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774339316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
	b=XaS7RrN2OuhEUn+7HuIBHCuNtBbdJTrGnr1sNoNVXI5SMCzOen7R0BR6oaDRS+HbvN4GqT
	V4n7MZoiMdvqDNVpPIQX8FiwOHAuoBG2eObJtWylDtNR/d9hnPBnO30Ij+XzVbkULV2KUS
	2LmgcOSwnWhc9RSrL/DYQpfLCATRkyU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-K9bcidBRMuibIOd_5SxW_g-1; Tue, 24 Mar 2026 04:01:54 -0400
X-MC-Unique: K9bcidBRMuibIOd_5SxW_g-1
X-Mimecast-MFC-AGG-ID: K9bcidBRMuibIOd_5SxW_g_1774339313
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-483786a09b1so13081095e9.3
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 01:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339313; x=1774944113;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgd+vofP82cnhY2HCjU8+4Ds20YvfUWfxFen0NOxHQs=;
        b=e+mgqDX7u9SJRyxzP45yq2j+Ydey4xefNR3re3aSpD37MxmV+BSF2lFeB1mPkLcq3W
         Tg6BkfVQcZaVE/rqk0dZOjYMNdDrLwGioqSJUNSFQ8bTlLkxijw0Nql6Om5I0qgCCfy4
         o+alraThkdKimaJIHjbE5u15N62fzjLopTUhkI7cjH8NYSZI7Hw9vk4fEL47pxgnCvIU
         3rwivkalmSUd6ZybPf/+hQCzOy6bYNtM74ie/oHndU6zFC285Axz4z4Klj1V1ELMSsw0
         c/nD60+lsMWQyPjbKXTlBMocQLh+/Gk5VUwpRGgKnX/4Gyr+j8Gb1jzHxTHV2ibk9BPM
         sNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhQmFXSY51zTiUxIW410649Isn29/JV1BRGLLW5kr0U9TN7PM7a2ow0mBNkBJ1F1zjE0OMfB+79Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQEc6lGJl+06fLdDVVX3hlldUXOapHK/wrpIUdxKiy5y6Z7YcH
	lYiUHz/FThxdJschdSmQDEL6Lyy0XEVQqoIpQCiMVWd+kRWebp5SP4tbM0z8Yei+WsbBqihZi29
	PvAxNY4RJ0K5xr8aJYkytFlK01brB1WjnWmGyt/bb2/H9IcI35+/DszuJLH9F
X-Gm-Gg: ATEYQzzI0t9oYoJzfFzco5IjbzFS+etctaqAQTdSZ36czDoalo6g3h3XOXQQIeDavTO
	toqjDbWnQhhcFEneNnyXDEs0BofhoiFZYaGGsWZtvzi9vDe4uv9Znj+kPseZkt6W+p+JnIjoBI0
	muGph7RU4WeGouCl7lzSOjWOityVb9MEGrZ7q9zQI/EGMBAuA+B7r9RG9mGo53pDTEnmLH/Bo14
	uB6ESn7nplGaZDTc8+tNa85wSm5NwyPLS/WvUCKXqZTiOsmld5nA29iLOOiuMu/Z/a13hSk+lw5
	XlIyaNSHu/mixtwDtC9C5hFGtp82m6C0b64UX9DXErrrbc4NCudtegM/llrqGir5RZfy3/ovgIy
	z58cZTfe3DOMxPda5aVURGq97566/ivDb3QB4KJ107N9iFPgjPe/ImVdptaZ0/4yLcOBSoknl5m
	Bz3bU3
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216112585e9.27.1774339313302;
        Tue, 24 Mar 2026 01:01:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3554:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-486ff01cc5bmr216111995e9.27.1774339312748;
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f173csm38812215e9.2.2026.03.24.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:01:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-6-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-6-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 09:01:51 +0100
Message-ID: <875x6l8xlc.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R0VYpMGJcJbMgls_DB9B5ftJjmO_0hKJXDQBRzqAiHk_1774339313
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> Enable the DWC3 USB 3.0 controller (USB#2 port in the K1 datasheet) and
> its associated combo_phy (USB 3 PHY) and usbphy2 (USB 2 PHY) on the
> Milk-V Jupiter board.
>
> The board uses a VLI VL817 hub, providing four ports. Two are routed to
> the 3.0 type-A connectors, and two to the F_USB3 front USB header. The
> hub requires two separate 5V power supplies: one for the hub itself and
> one for the USB connectors. Add an always-on regulator sourcing 5V from
> the DC-IN input, along with two GPIO-controlled fixed regulators to
> manage the hub and connectors power supplies.
>
> Note that the board also provides four USB 2.0 ports (two via type-A
> connectors and two via the F_USB2 front USB header), but these are
> handled by a different controller (USB#1 port in the K1 datasheet).
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

