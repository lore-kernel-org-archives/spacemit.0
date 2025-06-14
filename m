Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7138F91
	for <spacemit@lists.linux.dev>; Sat, 14 Jun 2025 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749869643; cv=none; b=RMkLvZiZtUP22IqF2R/vCC+RCcDs+wuRW3Mke2sGA6k1C28iGmS08RdI+4Td5RCX5VG0q1ovWc0StA3IW6pRvCfSB/mT6rLvaE1UrW1kbK1WDcSRjy8VSp7Q9tih8U/2duSOYelRdB/gdONNa1Kgg8LwgRR38kK5/nIhaKnZ3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749869643; c=relaxed/simple;
	bh=w4scoFNKuQowY9iouTExwAiGSnUFMmeHza5XmTbM8DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSEgb8y00a77NwgNjMrNvn15l/pfT8Wj727j/dtnm5qz1+h0+X/4g7nL6yDnlehKiqTpsOIqJngaqYVxKazDGn33TEfsWkPF4xW6FuHd6wRpsU/WUkrRDr8bI/AQVeQOvuxuk4Enq9tWeFiLc7+6hct6n9N02d3BjD4N0mhc3fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=F+cAIMd8; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="F+cAIMd8"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e447507a0so20562827b3.0
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 19:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749869641; x=1750474441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=F+cAIMd87WC8l/wExCp/WlyxHoN//bgpx0BaihMtUUFdjx0cK03+jITAdJIX3Q2fFJ
         mXt03ahzN6m/ucyBJVrGJ9ALLSKc7xiX+v0y96tth51dPO3VazH+QICbLmZ19GRqP/2T
         tiS6Q3qKKHvyozoR8kim0A0XAVHMBJRAz0jxLgo+gS2KCVGBQF0GojrtFP2eHb6FOS8o
         RonKr8TBIAXLiDsOLa0Jwu4xpC7QxIS67TI8XNYlPmBgeBoz9F/JjTX8p6FswhI5WjBT
         7qSaBgT4dwQAGBuuqxCOBuh730L6i6B/Uq3dIQn+lB8U5x5QAtTb36/hx/D4uxToIT9y
         bdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869641; x=1750474441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=OtFcY4QzjF3SCIVWYLslshPwW3On42igpLgeLLaQ4oIS5BfidF4BUx7/oimdudfAXn
         wHqf9qyvRP8kx3aeH6TaAhBSDgwfWE7Cxb6uWbuWFxxdE5vlIQ5kzunFd1yDfj3RWrwl
         uDfadwnPCvzdF7PZeUozKtrVld1EcyA40+zj4iyyCGK9W41y/1PATIeeM19louYBbuWu
         ptP+fYIM9jPzoMp8LO0vYCgGLYO0O9foblWmJaq50rhl+8C7CVvYfB1rW873FSLgarcq
         bTS+2/AmNoUNTOm/iqUhrFv5vgwSO2vjHmO9g6AuYKSSijkRIIBga71VYLe57fA5Yjb3
         Aw6A==
X-Forwarded-Encrypted: i=1; AJvYcCWZgGAOUWJf7rLykWt8kHLtaZ0cKK30FmWnXQ8KG/tAl6aiM2OHe1+J+qj5u/nUzFa+LKeaC2ajZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQgsGUE3oXBk7bmCEs4c1pv8OicAcm8bYdcJSsfyIJjPg3dGfY
	wMvVNN9FYmW91g+qnW89KOS8ouH65mtt9T4/RlX+PoQ9AWty8WMcZ+ehJn4P5DsSnGkirm1yb9S
	1NAdXuZFvtx9kV87Ii9BQEcYQUWrRAr3Q9ktC08HVrw==
X-Gm-Gg: ASbGnct/licW/Yw/qHp4gkqXOyvDLFSP6mC32WUSZ6s+iS9nRrKnutLKsLIAiYepoTv
	w0I/qmYUNwl8fvkSVNEfhpBe5Ox3MacwPMxU+LsWtA+7WVF72x5exMEg6kVlmPeRIeHLo+5rMeY
	qLtG6qkNe0aV3JmveyEPLvV+TiFx8FPHTjSwH18SFqohFQ
X-Google-Smtp-Source: AGHT+IHcwod9d585wIy9espWy9CTasZig0QiZOdlUQMf/BDe2eeDnXq8w+5El8L8W1GrR0B+DqxTxKI2/p3Xm8YnRRM=
X-Received: by 2002:a05:690c:7448:b0:70d:ff2a:d686 with SMTP id
 00721157ae682-71175440983mr25217457b3.28.1749869640812; Fri, 13 Jun 2025
 19:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
In-Reply-To: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 10:53:48 +0800
X-Gm-Features: AX0GCFt1J7cK2ONSBYRJxYGgLZ03DM7CsbEBM2NtLfq6P5d7b2_ITgbQ_ARUd5g
Message-ID: <CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Vivian Wang <uwu@dram.page>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:07=E2=80=AFAM Vivian Wang <uwu@dram.page> wrote:
>
> Hi Guodong,
>
> On 6/11/25 20:57, Guodong Xu wrote:
> > <snip>
> >
> > -                     status =3D "disabled";
> > +             dma_bus: bus@4 {
> > +                     compatible =3D "simple-bus";
> > +                     #address-cells =3D <2>;
> > +                     #size-cells =3D <2>;
> > +                     dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x0=
 0x80000000>,
> > +                                  <0x1 0x00000000 0x1 0x80000000 0x3 0=
x00000000>;
> > +                     ranges;
> >               };
>
> Can the addition of dma_bus and movement of nodes under it be extracted
> into a separate patch, and ideally, taken up by Yixun Lan without going
> through dmaengine? Not specifically "dram_range4", but all of these
> translations affects many devices on the SoC, including ethernet and

It was not my intention to add all the separate memory mapping buses into
one patch. I'd prefer to add them when there is at least one user.
The k1.dtsi at this moment, as I checked, has no real user beside the
so-called "dram_range4" in downstream vendor kernel (ie. dma_bus in this
patch). And that is what I did: grouping devices which share the same
dma address mapping as pdma0 into one single separated bus.

The other buses, even if I add them, would be empty.

What the SpacemiT team agreed upon so far, is the naming of these separated
buses. I listed them here for future reference purposes.

If needed, I can send that in a RFC patchset, of course; or as a normal
PATCH, if Yixun is ok with that. However, please note, that would mean more
merging dependencies: PDMA dts, ethernet dts, usb dts, will have to depend
on this base 'buses' PATCH.

Again, I prefer we add our own 'bus' when there is a need.

+       soc {
+               storage_bus: bus@0 {
+                       /* USB, SDH storage controllers */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>;
+               };
+
+               multimedia_bus: bus@1 {
+                       /* VPU, GPU, DPU */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x3 0x80000000>;
+               };
+
+               pcie_bus: bus@2 {
+                       /* PCIe controllers */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0xb8000000 0x1 0x38000000
0x3 0x48000000>;
+               };
+
+               camera_bus: bus@3 {
+                       /* ISP, CSI, imaging devices */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x1 0x80000000>;
+               };
+
+               dma_bus: bus@4 {
+                       /* DMA controller, and users */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x1 0x00000000 0x1 0x80000000
0x3 0x00000000>;
+               };
+
+               network_bus: bus@5 {
+                       /* Ethernet, Crypto, JPU */
+                       dma-ranges =3D <0x0 0x00000000 0x0 0x00000000
0x0 0x80000000>,
+                                    <0x0 0x80000000 0x1 0x00000000
0x0 0x80000000>;
+               };
+
+       }; /* soc */

> USB3. See:
>
> https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut=
.edu.cn/
> https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.=
ac.cn/
>
> (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> none, but ideally we should fix this.)

So, as you are submitting the first node(s) under network_bus: bus@5, you
should have this added into your patchset, instead of sending out with none=
.

The same logic goes to USB too, Ze Huang was in the same offline call, and
I would prefer that we move in a coordinated way.

>
> DMA address translation does not depend on PDMA. It would be best if we
> get all the possible dma-ranges buses handled in one place, instead of
> everyone moving nodes around.

No, you should do it in your patchset, when you add the eth0 and eth1 nodes=
,
they will be the first in, as I said, "network_bus". I don't expect
any 'moving nodes around'.

>
> @Ze Huang: This affects your "MBUS" changes as well. Please take a look,
> thanks.
>
> >
> >               gpio: gpio@d4019000 {
> > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> >               };
> >       };
> >  };
> > +
> > +&dma_bus {
> >
> > <snip>
>
