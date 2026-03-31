Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92B3A1682
	for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966611; cv=none; b=dprUBxTqOrM3NBvwgxeEQ2Qr9K3mRh+RqOXBurnGxs8azt3Sv/iljsmWLG3fgBwpk/lQ8Cedfb67TN/rMdms9CDPAw1sBYo+Bs6VLCrAys29B+bQDtZoufQg0KOrGYWRLaLBCvxFkvQUszEGXp0RIWcxFozw9dDB5rRdMsUbY/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966611; c=relaxed/simple;
	bh=5Iw9URBB2+huCGNNmJnyie/vcU11kN7G+C2oBsp0qj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Plr4ttT8ifR8/j5bcs6VbmiRgKRpj4qAFAVMNqz55JW5ujNKC9YyFiXJVCjPSrYsUnz/rihuSpiy0qY8jo65dGAFNIqPHMWlYr6X3m7GECbXrIhVez4dKvnndWnCH3prR5sACR+b4tqYI/KlLCHdppmsNFHrs4UAj5VE78nPRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOh0G8x7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOh0G8x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774966609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
	b=IOh0G8x7Jb3pamMC08Q0FMf15bzzEab+J5nT3q/ySXOiWm35iOWyzffd6NmexMyBpe4YOV
	lXs6imvCZBzlmrOSOLrVejOdVGsD4Ig5wjA3AB0Uy9HEo/u9yppL4obawD2D/+3G0ECgay
	uCTBvGOX91c4I8ClQGJAzOJpRbhu8UU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-0Ol3atrYPcavYjkl2_oF5Q-1; Tue, 31 Mar 2026 10:16:45 -0400
X-MC-Unique: 0Ol3atrYPcavYjkl2_oF5Q-1
X-Mimecast-MFC-AGG-ID: 0Ol3atrYPcavYjkl2_oF5Q_1774966604
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so188076871cf.2
        for <spacemit@lists.linux.dev>; Tue, 31 Mar 2026 07:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966604; x=1775571404;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=ssmiTVn6qsKp/rhJpzYDkwqR41Q7yNGWSdzX1R36eiPn6uTpQqawmgCEp/tZumxyv9
         ffs24O65XarBN9IUhgp2vDoZoFQ7gQ3fa8AN48aO3Xy5V7obyx3vpT9I358XhmNZZ+52
         ZTcxP1nuWsrL1kUHzBU22+qrMcZjiAX5QGXWUmGXfJUGgwdDY16ZWOk31POVwlulLywA
         7L5I1Ggz4ihUVvE71KKtll9+URJhbaFtX62FBloF994Ku8sP9kyCLNgIT0pDCvy+tLNC
         pNN2ej2FuXFCpQsFlsQIyvLmO+cZ7Wq/k8Bi23YuvjSvHRoGV9rfSx58jC4fmYnT3VF8
         xuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLHo5987k5UKCxnaG2qxdf6TyX5DACx+eBWo0z5RETL+7Qnf5mZUNtTN2zX8LjpzfGzZ3ZodR6xw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1O2TJJ6fWge9p1wnbCp+MpFRKrjnhkjtxYP6XLPUzIS57drHc
	WgtCGubKRHc70QHf1SkxuoB/L0zx66xcQlan9dlGKOnN5C83fmYQYpmJdEHqqOP3GmdxfeNN9a/
	GzlsyZyCfmO1ZNamKHZPFQDwc6WnfxWGXxdybizoxDyYNHCySnO8It16G/LV8
X-Gm-Gg: ATEYQzzvQrLi9xjM4twisJo+noQeUlj4AyL4pqUhuVtgarsscSKgBgzGjYUtpkfm9Ai
	ANo6yaZO4UR4bHvjTczTVI5NrGft3pH+8XEKk+nb/RrB2A0IUN2373/V/r8kae2YOKKbr/3Qf+x
	OawuIQGclZvxIMiE+8d4pV72sEGkWw4LnHMPZ+G48aHUZctzHc0fNKVm9yl7ruWWnq+6f3ZFmcG
	qLO3ECOyHf9Z/cIWM0Vjz+sOue6NhVNWsrcQWNeKAYqsYEGOXoMlImCtsva/dD929slip/3+hRy
	pxgAW/wVRhmAlbPmFs/tVNk6UJZTC0ZL9RLS4HgAzevJHja39s13S9cU1sgdQdEdXTmSEO4FomE
	xw0qfHvfja45+TdoW
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957721cf.17.1774966604506;
        Tue, 31 Mar 2026 07:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957191cf.17.1774966603971;
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm86643111cf.4.2026.03.31.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:16:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as
 CLK_IS_CRITICAL
Message-ID: <acvXSXNWIEcDUpQ3@redhat.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v6-dkZUpXvZ0GTlHKws1T5P4swunQLOntEDrMV_q5TY_1774966604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 04:27:07PM +0800, Troy Mitchell wrote:
> top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
> all memory-mapped bus transactions cease to function, causing DMA
> engines to hang and general system instability.
> 
> Mark it CLK_IS_CRITICAL so the CCF never gates it during the
> unused clock sweep.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

