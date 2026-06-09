Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8191D3EDADA
	for <spacemit@lists.linux.dev>; Tue,  9 Jun 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046906; cv=none; b=E/G8/OZxM20yPKKFk58oYa9uXFwqNP9mlZuFNIFBVU8jPl7mWRBWqPFVkQhdDG3cbTML/cGlP/I+obI64yPGibopx28fBLFxv1VZ+GqUISf7FP8TrjAMa7VlZ8BzW5jFH/SlKporsSWQihfwzOl3i3mg719KTz9Q9jaFLJZjza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046906; c=relaxed/simple;
	bh=RuVJB9nyNrq3adxmXLdwNELFE9kcapRmML0DfpetoKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPjGDsxyBEuxcb81M173dh08l+x95CvUgQZ4NOWQx2yuuWpUrNv6QVrR5IYPVQ1g6l/BOXsiy+NVfZs+6pUNNE+Pzl/IYu1SsvqQG3WxjSOKpfqPxUeRsbZKcwzg7yBWuvVVANe978Pk/B3GTs60AqlNoUgAIHBefdtZxQ+U8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQlNZxe4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQlNZxe4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c3184c71so47106695ad.1
        for <spacemit@lists.linux.dev>; Tue, 09 Jun 2026 16:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781046905; x=1781651705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae/32RAlZzOkrMKZrBalt4ZXi3T3OToTPv5Duv2/6FA=;
        b=XQlNZxe4yVXRtKg88wYffh6Rxl2959NhC+6kf6izntXEg8bIieYVlTWDnvxZ3qYtVK
         jZHJmf3QdMmVQ/JilrGOrCxQ9t2Rc9ZKkRwWRc8TrHHVHJ1WG8SqqvSnQ9Y0ATX06Jck
         2RUrVMfbjx3rSM0sfnuzdhNfKwgmMLR0VSJrspWViL+VmYwOCpc5jlftXq7MlbQWJlfF
         8V+QmDm9Vn2H0cNhwlUkF6oGGO0J+dQEO5Y9fwhrkmicKTGSIULm31BH4p3fihHGMQ1x
         PD5dLv+ct+l9I6yQoEc70ONItb692FoSogQ1BuFPDPFrFOJedn9CqLYRESLfP9GiFIVd
         hSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781046905; x=1781651705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae/32RAlZzOkrMKZrBalt4ZXi3T3OToTPv5Duv2/6FA=;
        b=IZvw750WOhQfktJ2PlKoBtjd4KcyjoB7I3+peX+NS4HIMMkyKC/q6y+3TuuhapC9uD
         HA4nMVnQNkH7NqHL+j6KYA/SP9mdDE/aRsXqnBKYvV0pd4d3Grt1V7EScQ1AWBPr3dwI
         unmbCw3/Yf058Bi8GJMDgEjx2DBr8uFpqNobjlz+cYcQ1nXEm/XJb+xuXn1mb+NJ1OhX
         xflK9NvR6MobRtF0rum9VU2fDHwcopiv5yCV94b455fyJD1o5rnc04YGaoM69JPW4Q33
         VHjNUz3pJ7KVXDst+Osy6gHWxSd6LxzI9+DQhHooK5D+t9ZgZJrkmLzh1gtJuBrlLta7
         8f5g==
X-Forwarded-Encrypted: i=1; AFNElJ+SorETBtFVCbLO2bFM/h9n9dWInJxfnnn6aQIWZQWCXmmiMYRZGIDuvIvSys1xp3rfUyPHyvoqlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw7QskgEXguWbc3o8oszsPWCDKmWIhOCe+RUsk2VYx+wSi58jT
	OvdM5qBxGLE4LuewuBum0n4TFurEKxhTd0/omsKC1DC+vNPlUy5+TRpk
X-Gm-Gg: Acq92OFFGPT4vLWRu0ttmwLLiMxVyLyFfAnXl0GPmPFiiTEmNXTb3YEThrjw8ZY9k3M
	1Qp5KrK78IaeEX6AJCB0BTYiZHxxXa4gxobebedPmV9DH8DkWhM4R17GRk/GPweuadduGekJS6l
	ypLIArWmB2GjgNdaGJtitFvX7q0hcy+9/7SxMX6CgYvciLnGNI/siNjxvdiOO5yHLVese3ByeX3
	Q7nwKAbFIwqPLfwGTF+pl4oG4emzPgpjvThbLTzEZKckCWyw7NQ/OLjq1zi2qre3MoiY4gbC4IA
	Ad0kuYa1s6F7LLy6sBUpFuT5oT4sHU4m7MUW9sPmR81Qjtl+yFT3CByVyOZz+4ptleVEdAxSpcE
	JgoxQWRqVwN71x1K45kNsHHbMYZG4ix1JNCmRANfWiy4iYt7Ue/WrhXLWWb3quXyxBZYHWazvMN
	n3UixAu5LhIA==
X-Received: by 2002:a17:903:19ef:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c1e810bd1fmr284368035ad.21.1781046904581;
        Tue, 09 Jun 2026 16:15:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm211741165ad.12.2026.06.09.16.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 16:15:04 -0700 (PDT)
Date: Wed, 10 Jun 2026 07:14:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Rembrandt <kernel@rembrandt.dev>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aiid4Y6x6Dbbwszf@inochi.infowork>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aihYftGNcpUd4UUR@mcmanus>

On Tue, Jun 09, 2026 at 08:24:46PM +0200, Andrew Rembrandt wrote:
> On Tue, Jun 09, 2026 at 01:37:56 pm Inochi Amaoto wrote:
> > You should set tx-internal-delay-ps of the phy instead of
> > the controller. This is a phy in "rgmii-id" mode.
> Thanks for the review. I don't think that works on this board, but
> please let me know if I'm missing something.
> 
> The PHY is a Realtek RTL8211F. Its driver only toggles the chip's fixed
> ~2ns delay on/off from phy-mode, and per the datasheet that's a hardware
> limit, not a driver one -- the RTL8211F has no tunable delay, so a ps
> value on the PHY node has nothing to act on.
> 
> The only configurable delay element on K3 is the SoC RGMII delay line,
> and dwmac-spacemit programs it from tx-/rx-internal-delay-ps read off
> the controller node (spacemit_dwmac_probe()), so that is where the
> property has to live to take effect. This is the MAC "fine tuning ...
> values expected here are small" case described in
> Documentation/devicetree/bindings/net/ethernet-controller.yaml: the
> RTL8211F supplies the fixed ~2ns via rgmii-id and the MAC adds a 400ps
> trim on top. Ideally the PHY would own the delay, but as Andrew Lunn
> noted reviewing dwmac-meson8b, that requires the PHY to implement a
> configurable delay, which not all do.
> 
> The already-merged k1-bananapi-f3 does the same thing: eth1 combines
> phy-mode = "rgmii-id" with tx-internal-delay-ps = <250> on the
> controller node (via the K1 EMAC rather than dwmac, but the same DT
> pattern).
> 
> Would you be OK keeping it on the controller given the above? 

Yes, it is good for me.


> For v2 I can add an explicit rx-internal-delay-ps = <0> to match 
> the other SpacemiT boards (k1-bananapi-f3 included) and spell this
> reasoning out in the commit message.
> 

Do not do this, just leave the rx-internal-delay-ps untouched.

For this patch

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi.
