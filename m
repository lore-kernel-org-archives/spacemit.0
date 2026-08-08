Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92B243964
	for <spacemit@lists.linux.dev>; Sat,  8 Aug 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786199962; cv=none; b=rMUXukRk7SJf7qD+qT3grYwptnOKyN1T/UAQGrZwV3l4kd+0+cuM2M4tnf6uqEOv74f9BdXvQhZHChYZ7UyK09QJyJgfjruABb8/4ZdCNomUNrJarWRIGE83P1mEV7m6WotuwYY3n4TyY7z83viOGtq6RH7NayX5o73FGJOPcVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786199962; c=relaxed/simple;
	bh=GNZdbMnUJ+VqGa8a7gNHiTQSeSgxpLKBAsS0DNjAnew=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWVQwC2DMOz3Djur+x4zeL2qEs4oPaOCV5h+lcrdQw2h0Lg65lMNaMwd3THE7FpyZxl9wiz2IZoEuAym2UkBpDXYyp1XQlQoZNyB5i9KM3BhZcQl1xLksB6q+EUrXqG6IJP7riSxvXyWnVOBA4wAdRVqT81vt1onPhmoaoXgV1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9mCAdBF; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9mCAdBF"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so595759a91.0
        for <spacemit@lists.linux.dev>; Sat, 08 Aug 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199960; x=1786804760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=I9mCAdBFONrZEo3EbVT4ovjcnh+8rW4bprtefR6DACTg0CLwNWzsyKkHwbl0RaZJmK
         0bGn30btyvIP/eiDVHl+H5S4oFyPLVLc49DbVOqcNNl3ZDNQLGtvH6Ffkvx2SH6nr39M
         /G8+iiNiEmlvBWAR3zvqQbB/6csHRjQ/D9qGQsvvTrE1EuWYi/hyjSquWwayZO/dSQJ7
         RToAPGUtBDWC47VPxDrOO0tFOY2T2mFNuwRW5rw4aS3B561iC72zIOHa0mg9TjtFky/I
         CNkSuGXJtNv3Bi/XgKPEPBLSda0ZCn+7ZPBZCiuUB9ybAoXEbr2xEsHkp4qZmtjjBr+A
         kCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199960; x=1786804760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLPlagPSnxq9fTONnyyz/3ddba5KQ5Gz9V5u0Vh5tVQ=;
        b=HaeSicIl88kUmMkMbva6569rcdgVJJKZtmjSue9Z4Msu25hBR3JVl1BX/FVoMITvW0
         oCt8DUo0qTKFw4xQNWcui8jhO9Tcd3lwe8qRI9ZNl009/Bk20yF5VppV2+PnjnlylTW+
         S7CE+bs1+tNaRFhmbBKU7FbMVXP771ghL21e/asSnQHEhdBrKWAzYUb0xDrW/db/e4UK
         4h/fWsNncMLVp8qjAixNkBRHwpdcVU0eAjb/MQMIAkXQJ2rQ11Qu5CbcNSRTA5YxgAub
         loFZaMBf6h73JVlORi3HXQ6lGKAf62LQNPnfJej4yad90C6BKNUOKKepLUq+n37ebUPa
         8vWA==
X-Forwarded-Encrypted: i=1; AHgh+RpTvGQNdzDW0EET0keJ/gkW88F7wHJLn6SoszDahuTd61eJIjjtcdDo2+07VQELDYr9WzvCS09XfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpyV7thT8U/K/rqqMFbh+IibpSZnDy9L4ZmhysbBMbJL/nfjr0
	iOmqB8YKw8b472EFOvJS8amjbpEYQ+k7UWnMR+fVTbvdgaFg4V7X7+18
X-Gm-Gg: AR+sD11IicUcQbRvuRDS7VwTSN5Py928ej5ZLxknNHJnxrBP4ZsSjG/t7aEFr7MLdH7
	1k0wfaVWkc6v2HA5TrDBT1zks7FMBuImDMo58C5HhRvWBACqP+TWx0WSDOUCmM4WENvPgoQFFRV
	a6XsBr+rHlXoLTl5aF6GkaRFbjfVHqsv1A/OmCsY/gcIeThfw9e0Kpkv5U1YHk7FxEwMgoa/49c
	/5JNXO8EAS0i6M9xm+lKwCFEtkY3E1bTmV+aTjc6j4wlzGKKBkm1HNZ/+NZOKGUnAfpxsgkdZI/
	Du3HF2EornoQ/vCq8ubE600h6C/Zz0CPTsqRS+GLRDOFGicV3eXZtn7JgD0PorLiKaO6umF+XCc
	TaQlXmYGFinKaKy3XnpXhX19wjX9ksC2M9r63fVQfgsTZaKImsAowmD/YVvQHFLqQp/QMjjbjYS
	fJSzXNOVPhREsJOPNIzdQizSq5YZEKpfQRomR0B94=
X-Received: by 2002:a17:90b:2585:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-39261fdab5amr13832835a91.7.1786199959787;
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95794sm6424491a91.7.2026.08.08.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:39:19 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:39:16 +0800
Message-ID: <ec84e2ba71be5e82a3afcf257129bf58.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
In-Reply-To: <20260807230404.GA2211679-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>
 <20260807230404.GA2211679-robh@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Rob,

On Fri, 07 Aug 2026 18:04:04 -0500, Rob Herring wrote:
> On Sat, Jul 25, 2026 at 12:51:12AM -0400, Cody Kang wrote:
> > Both K3 instances are the same IP and share one compatible; which one
> > behaves as eDP is decided by what its downstream port is wired to, not by
> > which register window it sits in, so the binding does not distinguish them.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > new file mode 100644
> > index 000000000000..865ea310daaf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
> > +
> > +maintainers:
> > +  - Cody Kang <codykang.hk@gmail.com>
> > +
> > +description:
> > +  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
> > +  SoC. The K3 has two instances of the same block sharing one compatible;
> > +  each acts as embedded or external DisplayPort depending on whether its
> > +  output port drives a panel or a connector.
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-inno-dp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Link and hot-plug events.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Pixel clock for the controller.
> > +      - description:
> > +          Pixel clock generated by the DP PHY PLL; the pixel clock above is
> > +          parented onto it in use.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pxclk
> > +      - const: pll
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: Controller-wide reset signal.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: Phandle to the K3 Innosilicon DP PHY.
> > +
> > +  phy-names:
> > +    items:
> > +      - const: dp
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video input from the DPU.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the panel or to the DisplayPort connector.
> > +
> > +    required:
> > +      - port@0
>
> Shouldn't port@1 be required too?

Thanks for the review. Yes, will make port@1 required in v2 and
describe the DP connector on the board side (dp-connector) so the
graph is complete.

> Otherwise,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks! Will pick up your Reviewed-by with that change in v2.

Cody
