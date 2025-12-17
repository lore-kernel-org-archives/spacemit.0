Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95912182D0
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 03:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765943319; cv=none; b=qBP8Y20/mp+F6KR3IId5Or8g5w/HWh/mLrJDXLRng3yhq50ArquQpSSYOqMNAak+tH/UvFBPjRvwGfNV2v/+5Lnl0+cRss/wKAG94Dn2ZpVSpPBabbiILNfyNREhXf00sLJd73mxR8dYtZFt2GFPQcaEucfSqVUNaOM3BiDXfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765943319; c=relaxed/simple;
	bh=8FvrpbOhdERcwaI1E1+Rw1nM08PWRfP4dOu/PKQvbqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uABR9DuLaJkdARTJ3Ip2VzQDbisVWjsGcexDSHkiObTAgF3y26jrGNlOzDM3pqFxshQMtqte/3XJHbexA4V8dUsoA0yDoD3MFyUf14GJz/hHxttvbXPrCf9IgKgUsvPaigQMf8IUOkhN9MrUwdSs1jilVvqpIczfU0+hr7fsstc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xNeSeRRJ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xNeSeRRJ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7881b67da53so47021487b3.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 19:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765943316; x=1766548116; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T94a7cnx4YfqtwUokEvbKCG0vEzrPFcv5snanGGxpYk=;
        b=xNeSeRRJq7nMmvklkT8CyJQuKxUQmbclPAFNJibAUS2acTtfuhVLJIMNif49Twj1ue
         ZvqXdfNMJu7pANuBeWZdUp1KdSmqqxQk9FrpBsHyAp0VPgnoanDrRB0/0BwvkppTqgy4
         WUnH1PwINLVy6oqh4kq2mtxU9mrknlFPO/dnq1Hhjgjfgb+pZr50KRtQtYI+qs78Wbld
         gWw1Q0lDMTyphvyLxMF3eZ96QZjKQoKAJyCPsZSBnwsgqYpFVoBwYSrLbi5AGGfZ6sPe
         KXWMvLRt/fk/15lda3ZaP9DhxxozQChgCk+VbgnwfhE+ZKK4HQ+eW6+G9uw8NF239GHt
         2bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765943316; x=1766548116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T94a7cnx4YfqtwUokEvbKCG0vEzrPFcv5snanGGxpYk=;
        b=wumBbaRlBu8ouOUZE4/BBtsR2FZi61Q6Bqx8t62OJ+w34pwwsJNfZDhzpwjlPqC2/R
         NINsbcqPeI6uxNtXQvZe40zo17qHUYyfeH+R9PxXu9d7ouWzm+OrRMRhQ2tzuPfrM9QM
         L7LqwAD6J/iMYlOx4XCf+DLbikqEPAfzLVGJXyIj8deAKGMMIoYKtzoatIzc1c6Tm8zD
         YxhWelcxlYiwdiHAS9aRVCtU1qRTv0un1dDgzD9X52v4qt7fe1or0VBbSOufmb0nYbox
         ZQnH9uyWR4Jqlthu/jlM220UOipC2/ZQK2GSoV+WOt5h14RaeGFqgNwrs7pPYjitev7L
         2IwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT+2iAsU8GlYId5d7FNxhGefn0rpL3yJ8MFc0pxwRVi2hLoo5BP0/2sdGmEFhBUEUHEDtZPLZmCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7+oZtMKE1HNzm+cVyhX4RZeIeuVNmPl9bigukfCKbNkNrvAi2
	hoPFIK/Ry1t9QVBm5fzoQQ3UYLPsHlsWJTUefLtmyg3mTOYNbM2zrcy+Rhc6O4+K1yg69vuHWyF
	YtoikYDC7CEwwuaJsLrSB1+0itoG1fxLykxajn8swpg==
X-Gm-Gg: AY/fxX516mFjJo8/fxNSGNk6G/dnZ4ljij6FIkG245JoJHj45RVzmT0Ana4wnc/EhOv
	OB7dqON8N9hd5jzKDQMj4pllbra3ZpqIQPbcSL9dgi9CMDbUUVeOfUx3qjZxP0saMpmN2RF4ulz
	eqkvuNmdBrPSuaWtkkzYp6j4AfeDno4O9wTdtCpiv7f05aiD07X7fKXdpuAPRVlHT81N+FcM/oM
	8pjZ1876UrEjuBlHOiIQlK8QDTB2Gwwbz7MuvB3yCV73EJIKcWvRII7ZyOyIcLY8xDpKChY1wSt
	2IpDVPUz6qvY8zM21FkJMSv+fImlEG0iPgjEK+gK3/h2
X-Google-Smtp-Source: AGHT+IGCRy+MgcC+gjoWTqizBxZYC2VIXnORXboRecI5mqVuneW7cQwX/1bYSoQ1MM7mSJb8g348UoINohu6U0LgAzg=
X-Received: by 2002:a05:690c:688b:b0:786:2f01:16fb with SMTP id
 00721157ae682-78e68331c64mr142690047b3.26.1765943316482; Tue, 16 Dec 2025
 19:48:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-4-a0d256c9dc92@riscstar.com> <b3af2b4a-1d70-4c49-a794-b4006e930fd7@kernel.org>
In-Reply-To: <b3af2b4a-1d70-4c49-a794-b4006e930fd7@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 11:48:25 +0800
X-Gm-Features: AQt7F2p6ARP-MpjYyTdAooXcg_070s9HlwUsyU9wcd7x5M0Aq4HZ6ZgO_uPeqUI
Message-ID: <CAH1PCMZdsUfurDqeRh2WQig=VzNx1k_3Z=1m_3TdJd2bYX=nVQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/12/2025 14:32, Guodong Xu wrote:
> > Add compatible string for SpacemiT K3 IMSIC.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.ya=
ml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,imsics.yaml
> > index c23b5c09fdb90baccece03708f4a381084b22049..152eff7335dd8457bf01d02=
497b7080f2a02ab65 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsi=
cs.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsi=
cs.yaml
> > @@ -47,6 +47,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - spacemit,k3-imsics
>
> Also not sorted. s > q.
>

Thanks, Krzysztof. I will fix this. q goes first.

BR,
Guodong Xu

> Best regards,
> Krzysztof
