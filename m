Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8930FC12
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955063; cv=pass; b=QCOCQh4CVe98IvIJelXliqtfw8E1LwwDZA4DOsYWIN/NyOMumEC8BvYSu4y8YVajF1uCOQQuqjVlwVHWezkTtW59f9Ys/p5ZTTGTfScCrQ5kfpYiqIDIWumKePL2lJbRa0vEF90WlEC4K9eRd2QvjBo6IfFe7atNlprZDMnkjFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955063; c=relaxed/simple;
	bh=DdmiiPv2CWV6FGKdSRK7QlPHxig2ZU+jUpooF0D21NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZkjsrHxGJS2+277S5Ivw2ln6eiqtthMGKCsCRNbAlNQJ3msbAMHvJ/qx0FKZTW1sGnyzhQ64Do04O6tsyjHC2H68MPWiQmD2e3QLWpcyijStvxpcj4kiPDXaxklMcLBJm7mqWUyLn8F2NmCxQ1X43hjxdtzQSpVEoFAAJYKW0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=FbJu52ZU; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="FbJu52ZU"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81eb41c1f1aso6008957b3.2
        for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 08:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783955060; cv=none;
        d=google.com; s=arc-20260327;
        b=YgsTw7IPsgpyks1yp1Osy+x2o+3NMgKdgFKr4Tq/n2FV2lUE3E73JzItk06gQ+O/oS
         NJXcOIBgsmPBheNVgNuy0Hgk405k7gvs1xfd9XGPdZu8ExEVP5BSbc+iekC8v7qbeXbD
         EEaC6f8h3ymHxwFU3eqpWyrNgN29i1Wf4E3uTlCZW2l4JoX4kIJaDyI70iGnwm6J3gg9
         lx/mYjKWmumc69mUc9wvttDH5Vn63pcVq+3Rhj/uMlhNiXFLha9q3aV3wMdeQv5bA8wR
         YEpxBO48DAHH43Gm961uW6P/s2ce00sRza9H8f6PIWukU5Mc+XXsnWh5gRqlc+Ss3Ske
         VhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        fh=AWW+2GhdnWo/OiyRZeHxVHzBmpqjyBhwPGYYlTlPqQQ=;
        b=iSZOIksn94kWlmTtwc9awoHfoXXTdd+sUOCfDRPRY5ahQOK2Xch5NkUc8SbW8YGyUd
         xB4RA0dwvAqo+pjcewHPqZPyKlsnLmMtg6Uxx8v2RhSk/q9IQv7iObO5R+n1dGzE/FAm
         WsRK70PWVqO0UE6FYKyTg27zx4PLDIdrFAkG8boKhSqlWO8zQUHZ1On1Brd48uBJjEoi
         csEBPP9EkeUq/D7BiCZ86HkJpSUkiPiaRkKbbTaR7CqiUq5i2hzA4VJD23QpBOo+lsQX
         xKiUDoPX+ncEE7JQN97x9y0QKAFNGcj4ilbpYc1Zq4to9M9o1CC8nXVcBhGAkKo8V2rX
         QpCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783955060; x=1784559860; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=FbJu52ZUz/WLjjWnzlvufYbetB2py9MtLvTDdq1VI+mT1A24Yq9oc/AY+JjwuFXYXz
         ACmRoAfIkBzwx0h+BJkhMFjUIT8kahDu5M0TZIwWZrrHcGDz64+BamXYxszwQtyiOzNI
         7YnnTu6jJXrUPJaRpxFANCKri6HxVbnvBPI8JkTwx6VXQwmvB/K9sb923T+moEl3n5v6
         BtrH/jGE5ZM5kIYAUnpMQTuuZ+Jj0jHvroAnRwpBHkyWX1N4+04bqPtYg+XCJiFYfShR
         EZBBpUr6pqa52J4wCAKk9z/0i3bRTjEh495thS0vxZT01teBDhiXTe1xPVJd1wa655Ht
         W2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955060; x=1784559860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=lZqE/r4jzncYUpTKsWm43gS5Z/pAVGz6+Se8QkKPUX4GA5daVMfJq3OB1cEOIjLV4+
         UZFe96Zv1V+xjpLahYvsPED897TwNphVAuXw5n2JLLGbOKJKwt4g0Zr9gcL77POaevB3
         tGeV8udOwP/LJ8aeD6v3e8f1jiNSEw2xEZX8VExiVXbM0Y6/kj+v1r+LtNXQDej0Art5
         y0Xu2fAuSh92/hV6j2ucIbnRFl7S4EvQbQ6NdGJpQtVjGiIsu4+Q9TBhy29/IBA282IP
         bx5UktVPl0GjPKwgF5OMhxT9nuOmYafZyW9fSSq/hO4S7nalT6b8Nqz3xYEDgy+M+Oub
         ZrLA==
X-Forwarded-Encrypted: i=1; AHgh+RqS1Na0pJ5ASEH/JaLiO7qOjrbmLVWwmkYo1XZfJs2MX8K6ccyAjH3QPJtBR+BWZdm1+UQrQu+e5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDbsuZ5dWAUYdEtN2fSxb8mNdBoMW0o+l8F0Ow9LLBbGNBYfuD
	svPQDZvkWGz1LOBCAcK2Xf/hphw8RMN3MxbCN3Su+OXan2FNcEJ17MZCHmfUVPo1hRLyaDGKEZn
	rMH6/2VvlWmmMjDhJQEHbFdY7YHk4cgALpn7in2K98g==
X-Gm-Gg: AfdE7ckTaCNRpvk7bU5JLnpt02ilLh1ox27NDHDXIp4HoSChqYfJoduAwwQs84nOAJZ
	cYRr1nDdqEjidSE/fLabFkxFmaYNZFdKOqj91y1KqFP/xJrM146Q3VFrXZKIXsUZddWmgSKvBTg
	hO9Wo021NnHDkYGLQ5pkyCZTiONc0s+qFSlVXnCI+H+yo/UuddKCP2V1z3h8fsr/JHzDGYcocJ9
	286l25gG9yYjjTcCFN62/nKSKKZhc0TkBVVH8DC5t+VPGYdaJmex61HhIPhxFAiJoiNTbywumHL
	Ht/sHLoFGfjaFsINiPjNMInQh1M=
X-Received: by 2002:a05:690c:6c90:b0:80c:85b6:75ba with SMTP id
 00721157ae682-81e902d8144mr73453177b3.67.1783955060060; Mon, 13 Jul 2026
 08:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709040415.977784-1-inochiama@gmail.com> <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3> <alRmA-X4xbQ9zPFn@inochi.infowork>
In-Reply-To: <alRmA-X4xbQ9zPFn@inochi.infowork>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 13 Jul 2026 10:04:09 -0500
X-Gm-Features: AUfX_mygn974aliQ_zk7qpCoilxAZo7T3vjRorPpP-S-Z4fzXu4A4fxxFoW4GGA
Message-ID: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Inochi,

On Sun, Jul 12, 2026 at 11:19=E2=80=AFPM Inochi Amaoto <inochiama@gmail.com=
> wrote:
>
> On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> > Hi Inochi,
> >
> > On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > > Add all PCIe device node for Spacemit K3.
> > >
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> > >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> > >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++=
++
> > >  3 files changed, 266 insertions(+)
> > >
> >
> > I see some warnings printed during probe
> >
> > [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=3D-=
22
> >
> > [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with=
 rc=3D-22
> >
>
> This is an expected error because the driver does not support INTx
> but the hardware claims it supports. Since the vendor does not want
> to support it, so there is no way for the upstreamer to add this.

Are you saying that the hardware advertises support for INTx, but
spacemit hasn't provided a driver that uses it?

Is there a way to let the driver know to not try setting up legacy
interrupts then? It seems like it's trying to do that now, and failing
to find interrupts node in the DT.

>
> > I see that all the 3 rc nodes are missing an interrupts node and an
> > interrupt parent (saplic). The vendor DT seems to have this. Not sure i=
f
> > this is related.
> >
> > The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> > like the card is trying to request 32 bit DMA addresses and we're
> > failing cause we have 64 bit memory only.
> > The vendor kernel seems to have a patch to enable 36 bit DMA in
> > the rtw89 driver. That'll probably fix this.
> >
>
> This warning is also found on my test, it is not related to
> the PCIe driver, but a lack of the RTL phy driver. :(
>
> You may also noticed a bad performance on this 10G ethernet,
> it is caused by the single queue used by the RTL driver.
> IIRC, even 9800 X3D can not achieve the max speed.

I don't have the ability to test the 10G NIC unfortunately :(

Regards
Anirudh Srinivasan

>
> Regards,
> Inochi
>
