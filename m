Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D68154BF5
	for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692681; cv=none; b=eDDI+6c/Qh7IbqPzbPXXZuQ3gEOTYrS7J8kXswlwr1tnc+FJvsdErzYejiDl/Zafw4WU2FqbbY5ZEOPpSKSlOg9miRiiFgWd+laSwCq0Av3fTKVPV50G+xcJ+bwepqaaNqdSLU7BdWN27ha0kWwwpdenhK0uOVia+8LHPL08NxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692681; c=relaxed/simple;
	bh=FwB48C92tnVCEdIyHZlamtIixxVon3uYizSE7TbXBRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcdG/Y+eD8yMMrqR6BrqJwWA+mIp8Ycb95jRwWUTiYhSgyY0OEJo+XlenqHa+xmvWXoHWkfrtayIKGbzpH1t/H6l7AVuaWPwRXOuhEpWi3htycS0OodK0xa3sF6vGj5c13O8e8OVBLHorRj1NwbwxxpyW68I0rAjIA5Lct0D0R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MLxd5aYW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MLxd5aYW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade5b8aab41so92619866b.0
        for <spacemit@lists.linux.dev>; Wed, 11 Jun 2025 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692678; x=1750297478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=MLxd5aYWav4BdQrZoTZHEsGDR2uHnHEJMmmx1JmeqNh/CqaGa/3NJsuHq6F8wyB2e8
         1GCIwymqq5QHmlARAfAEmku+wxXNTmHYNSabk1AsUJKxNrew3fqh7reYNSjYzSJWJ7ed
         34/2GeXtAUT8OeQ96qk4BjTd3HYOBCABYzm5yjU9J2TAYoBEewj4PN/sHPndqMlV+p+L
         bEj5xyTn/aTUzdGGyAog/a0ICNjJ1Nu2Huez2XzG//FTlhBFDDfxrtMWq/NLhxEgHzBm
         DklGRxFa0DKW+Kf9cmvrBy2GImsVYnkxsUqywkZk85ulDm8bL+AHVUBcUOwElclwYMUK
         pv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692678; x=1750297478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWcAfXUk5P+0YJPyZ9SkX3gkuCc87P45hLw4l1DcQZA=;
        b=sNg2sSLc8gh3HGYKa4CL78E19L6SuuNoLpFpDgFzkJOO/wYiTj82fqUD/QLUeZRzKj
         zrK/uTfboSp8o4h3MD5LFBDhsQQXJwpb5t5gW4bGYMiXgtLaZFwU0q9BhcltLn+pA48D
         1TNF7GUP42+7Rq1lssRjpRfiPXRwbacmzc88a8Q6wEGeBHdc59PlvkoRdvDKJv7z9MXY
         FQVwE+QerX63ZgtPxzbBzvSvGp0Qxi8HDMnQP83YJexkiAu8oR0rpo1NDuchlfk/M3zK
         983XU4HaqZnqkPRwyjyVg2+Je4bDhIdr9PoAwjrzyAQkTTsrxOqoNWWgjwXjsaniHOxI
         5voQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz71BniA8v7RD4SGV2KXMUU5UTv0u0Lf+PjAd7eHaz/BP6fG5dfbzJsxruCLc4YQ5PCOXasKxCXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxH/H+4PHQ6D5Gj3/SBDzunAz8kK1dunJ8yD02qP9W0gtjXIqp7
	1NoQ2NVZvW1uPvEnmGuiDXcxK+Je+DTWr6TJkF7poRz6ti3g4ZGIDO4/wdZVddEcptMlvs08gIE
	bZcf3b4DLR9n35F/7O3iNbG6qpW+9Ye2bunXwgjbwWA==
X-Gm-Gg: ASbGncuUPL7cwtEANKKZkiUfx6bfPFSrIGx5C4S/b9p4oavyLfZXUH0l7TYSPC4qldi
	2Ut7gN53ZHyCB0KH0M9tX2rKrq5F74AmWNlYWuLfeZudJCgtDse6OFpzWH9fMLb8PWkUPTvGDWe
	+CByehEdlvJBmbSxiuXjGmybGrirJqF6xpu749QyOBkgsXpTPXUEJtj54=
X-Google-Smtp-Source: AGHT+IF6ozO6AyxwG4za9A7i83BSzRL3SEEnwk5MfwoXwPW6m7AZDLNJEhC2j3KTRCG2+36HHH9N7IUrHjCnjqIf3Hs=
X-Received: by 2002:a17:907:7fa9:b0:ade:3a7a:26cb with SMTP id
 a640c23a62f3a-adea9a5a8f2mr111569866b.58.1749692677584; Wed, 11 Jun 2025
 18:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud>
In-Reply-To: <20250611-kabob-unmindful-3b1e9728e77d@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:44:25 +0800
X-Gm-Features: AX0GCFsy-sakH0jotNRCx536oNAS4R_g03uEq1Dp3TLhuOr7_lBJgrQdKtIkepA
Message-ID: <CAH1PCMYBPOerGKhMGUi_4AD-abF9wce2PgFMSfzi056FJvRJgQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Conor Dooley <conor@kernel.org>, duje.mihanovic@skole.hr
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, elder@riscstar.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 12:27=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> > Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> > controller in the Marvell MMP DMA device tree bindings. This enables:
> >
> > - Support for SpacemiT PDMA controller configuration
> > - New optional properties for platform-specific integration:
> >   * clocks: Clock controller for the DMA
> >   * resets: Reset controller for the DMA
> >
> > Also, add explicit #dma-cells property definition to avoid
> > "make dtbs_check W=3D3" warnings about unevaluated properties.
> >
> > The #dma-cells property is defined as 2 cells to maintain compatibility
> > with existing ARM device trees. The first cell specifies the DMA reques=
t
> > line number, while the second cell is currently unused by the driver bu=
t
> > required for backward compatibility with PXA device tree files.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml=
 b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > index d447d5207be0..e117a81414bd 100644
> > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > @@ -18,6 +18,7 @@ properties:
> >        - marvell,pdma-1.0
> >        - marvell,adma-1.0
> >        - marvell,pxa910-squ
> > +      - spacemit,pdma-1.0
>
> You need a soc-specific compatible here.
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -32,6 +33,21 @@ properties:
> >        A phandle to the SRAM pool
> >      $ref: /schemas/types.yaml#/definitions/phandle
> >
> > +  clocks:
> > +    description: Clock for the controller
> > +    maxItems: 1
> > +
> > +  resets:
> > +    description: Reset controller for the DMA controller
> > +    maxItems: 1
> > +
> > +  '#dma-cells':
> > +    const: 2
> > +    description:
> > +      The first cell contains the DMA request number for the periphera=
l
> > +      device. The second cell is currently unused but must be present =
for
> > +      backward compatibility.
>
> These properties are only valid for your new device, right?
> If so, please restrict them to only the spacemit platform.
>

For clocks and resets, yes that's correct, only for spacemit k1. I'll add
conditional constraints to restrict them to the spacemit platform.

Regarding #dma-cells, it's used by other platforms too. You are right that
it requires clarification. I should have been more careful in my initial
analysis.

After reviewing the in-tree device trees and driver code, here's what I fou=
nd:

For PDMA controllers:
Both "marvell,pdma-1.0" and the spacemit pdma use #dma-cells =3D <2>;
Handled by drivers/dma/mmp_pdma.c with _xlate() callback

For ADMA/audio controllers:
"marvell,adma-1.0" uses #dma-cells =3D <1>

"marvell,pxa910-squ" is not found in any in-tree device trees, but based
on the original TXT binding [1], both adma and pxa910-squ are "Marvell
Two Channel DMA Controller used specifically for audio", and the shared
driver code (drivers/dma/mmp_tdma.c) also shows it should use
#dma-cells =3D <1>.

So, I'll add conditional constraints in the allOf section.
For "marvell,pdma-1.0" and spacemit pdma, #dma-cells must be 2;
For "marvell,adma-1.0" and "marvell,pxa910-squ", #dma-cells must be 1.
Also, as said, I will restrict clocks and resets to spacemit only.

Thank you again for catching this. Let me know what you think.

Link: https://lore.kernel.org/all/20240131-pxa-dma-yaml-v2-2-9611d0af0edc@s=
kole.hr/
[1]

-Guodong


> > +
> >    '#dma-channels':
> >      deprecated: true
> >
> > @@ -52,6 +68,7 @@ allOf:
> >            contains:
> >              enum:
> >                - marvell,pdma-1.0
> > +              - spacemit,pdma-1.0
> >      then:
> >        properties:
> >          asram: false
> > --
> > 2.43.0
> >
