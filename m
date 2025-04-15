Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B0D2918FA
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710908; cv=none; b=gVSMXg0gbCkEQTZzPcgrP2IY1gkF8TW4tcuDHv3kJE6ksqf4AxBDagIzDb7Xpl1bsPvYNzud1xRwTefcImQOUjIKrzifWGxGeU+3hffESm947o9x9LXI6tZewYBQ7otpOeZgSLfsL9re9Hzh3Aca1aWKCMyar4ewmB4G0EjpW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710908; c=relaxed/simple;
	bh=L0R8xGjLChjgStq7fgUrJ09AFQFLRTNk5cUsHXiRm/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IER0hPf7IytUJZuqA5uPD1NXnXkqMduN1qvheVSCFo0ZHZU3SXxeVcvS9aOHNq3/RJsAp+QTj8pQrM3F/DipJW8nixqNhZSe5a/lfzzPxs0iTSAd6R6htEO79TDmQgXUVnNRDxIYTgsCzilF9tyEzT/WKV7/qyYl8GXV6hCHAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rIZ42KiO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rIZ42KiO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1094909266b.0
        for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744710904; x=1745315704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=rIZ42KiOv98LQhDJ+dkiNezlL8fo4cMm1ZbgdAI7gm0v/t3QLF4H1DpLvjuNZrve1H
         TF1a9wm1aW9xjA5jVmIb3t4kcfG9+onNXsmBbNXt4WZXUc24EHDcwYC1Tm9mpmrKC7Vn
         KcLeqVqIh2jftNMJFDv7tZa8qEsHYFe3s72X1YUAAseSOXETsT7IJpFJ6ZgYwfel3HlS
         13Hi1pXcML0edJ3FOIsvUIU/hBNwP+FLpjVRBKZ+anRrfvx09U3LzobKgZqSaDLpBHas
         KSeXqtPtbpTZgjp5Qi2+8q3QIhpDGiSeU/MKIxalEfX3H5q+RYiWlgsQWxPAp3qWLkUT
         7Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710904; x=1745315704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=PIbd7KxblHFKyVGjvI4XSMmW0cA48dsd7hUMf+So8JJ/XAKq7S/EeFmimT2ExaWBz1
         CwnFJPor10n5xZN/qDKcNekMXhaPGDYt9Mt2eu0NFMnkDVCygS9kx8E4cSV8snqjLDy9
         QHZGh3+vh3fxHWLF1DvN+QCxXFlv2knk/8wKQhMeHNMO/N6FRRFsBLFTOu3m5j40rGlb
         JCnk4Wc26hx1mkAcF4SgoBEOMCFk4Qr1k2FvjYHD6MnFm2H3rRrx2LyFEJZ60oj8NU2o
         fkjK9xMRHl1ACtOEy+H79o8kjK9Bf/s5y17pcPqkKHiVGqcYBmGTog+fZf/2ZMvca+OZ
         dxVA==
X-Forwarded-Encrypted: i=1; AJvYcCU9/cjAVMhu8zcOqt5lA4FCaWaXdvADq/K/Mud4EJMydWn+Iwf5D1GeWuqeFZ48rdvzwHcu5YT3EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS34QthHfLoe//lu9pL8cJ59X72fGNL57zaga2tsR6KBEaHQ4M
	LRwAT4O3SHKxJBENWzTA1xfIN4S0Mr4vaf0/+HrGIXvaJTE1MEEKONzJZ5L7Bxr6mukggL4BCQq
	J80kJZtPpKBcefjRnuayyHa11Dq8VzluG/hVTSA==
X-Gm-Gg: ASbGncvoVuJ5eCBUjAt7yEVZB9eW2pdfFxKGcwFja55KOjpsfguYriKZAWq9yog4LHj
	Stks8otGwSKerIfFb02sM64fKRr3WpWszYcX/6gR5jymXKDfBM52ivyyiuAOTZRKladpOtp01lI
	PdrgQU5FU7xd5Mu6CQpatdwgCeBw==
X-Google-Smtp-Source: AGHT+IHAU8wJfJDF4eNSdv0Zm5P/kiq6Yogbh7eiqNmQ6osroOUsaiP2v1/BjbNJSKe15J8jBc9YnfV5U+5wxjTv07U=
X-Received: by 2002:a17:906:7154:b0:aca:dd0c:cfc8 with SMTP id
 a640c23a62f3a-acadd0cd3bamr1109850866b.10.1744710904488; Tue, 15 Apr 2025
 02:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com> <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
In-Reply-To: <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 15 Apr 2025 17:54:52 +0800
X-Gm-Features: ATxdqUGYHln9nntZsdf9jj-vYb0_3U3ad99wI0oBwmwTA_WUeFe5BkvwdaXHs0w
Message-ID: <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor@kernel.org>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:53=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Fr, 2025-04-11 at 17:44 +0100, Conor Dooley wrote:
> > On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
> > > Add an optional resets property for the Marvell PWM PXA binding.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > index 9ee1946dc2e1..9640d4b627c2 100644
> > > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > @@ -31,6 +31,9 @@ properties:
> > >    clocks:
> > >      maxItems: 1
> > >
> > > +  resets:
> > > +    maxItems: 1
> >
> > Do any of the currently supported devices use a reset? If not, then add
> > this in tandem with the new compatible and only allow it there please.
>
> Also, if spacemit,k1-pwm can not work without the reset being
> deasserted, mark it as required.
>

Thank you Philipp. spacemit,k1-pwm can not work without the reset.
I will add that in the next version.

-Guodong

> The driver can still use reset_control_get_optional.
>
> regards
> Philipp
