Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49C0225401
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 02:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300686; cv=none; b=O1ojDnAsIVSX72uJn0wUahceqM7Z9s1VEs/t026SISU/p9oPDVY8iakOlL2kIDzWdvicXfRBCE7hpRLwy5Iu6xxxx409SrJS9VNzkccSkCZqSn1E95ED8ry0ABjzSY5CLseoMTE0eRbLUvAOc1EDr2Zcz8x/f/JFjQVGMvRlYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300686; c=relaxed/simple;
	bh=R6t76eWH2HzIq2TB7HLKHxRY/f1IWLs6nx6TUFl7QAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjWTVlie37/ppbBVt3kJH/NWD7G+f0OYJpppedTYZhBGCx++2YDLCXlqz73Nbxja2BI2cJlItApzWpTx1GBRk8pdhRbcBqTrjrmblp0vjYDvF6JDQMzAD3Plf6+MkH/qiCrmYVYKeVAmhK783fhnEyuHJSQxwi5AmbAf7HEjLzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Xtv7RxO0; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Xtv7RxO0"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-711756ae8c9so3115727b3.3
        for <spacemit@lists.linux.dev>; Wed, 18 Jun 2025 19:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300684; x=1750905484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=Xtv7RxO0+QzIS7R3KWUK+J1f0RaA+DFUWbC7NI8nGp9JqppB53UlRSF45mv9yKWg2z
         uhjKIHqLnuj/ESpiQmVz7kpRmfNkdD1PAzgT3y3Uii4Nq9H/udTLG83JIpOp/Yz56JFD
         ExRuVQnlBxzThdQ7i8496Mr3sg5j1X7K+q6L69juGgwVZQWSdAnAVoOA+7dgFftkQrHZ
         AxXXvRu7hx28UFON7WDmYv4nfynFwuzGO/nwu6eIxPArYvyhzQOckWUQi57h95Db5SNS
         qAw6zHzXcCT6wT26Gy2RMT83x48T06t0I6Ul92QgORByaCzc8zHwwuU3/Ub7IVXinf9f
         c9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300684; x=1750905484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvyWk8eVLm4Tc980PDphhjuFD7XIh64AkzzgoplEgI=;
        b=TtHynI+xXiJZYxO2y19K1YvTC2FETlR8PVV6X+IXiozxo3GDxIgMIdKvz1aPRO8x6w
         A/j4UHl4psxMbgOpcXFTiL3wbeVBx+qXRMNt//l2fdh9b+MSUpx+MrhfaKXJPomGLruB
         S35JuPWt+MWBLoN6CiZ13KUm94lYil+N2Vk7SMzShCTySg1yryL9uk2pwdHogqqGd4MS
         VawqOVZT/3XdMJwcqXqKpXIjUwYyP1f3fX+bfCfC9RObUjNfp74Fq0So+476/LmwxEAF
         Jni43UJJzOVdBXL52WuxuGN24UX/aenAjd45RiGTFuPkZ30rVI000savEFg3Dt19u1ue
         77Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUdVE25U19D/UzsIuMIAbn0GEnaqX7h/9OB/4BKdQWsMndVoEsYg0goqf0F/0c/SxIBWy47snxIlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeyAORTCFWp8yiYUyFBrRnPPcqFljuNws3jkF55RUWsrA8Q75R
	ZUmAMdo0DEU0j2cI3QOGqE8c05qDbJiMf/D6qDVp2zNKPt0Vwb6VXftRBc7u7GgvBmeT7q11rHi
	cEk//Yxmtsp2tVSWZj5uOfZ3fT2WN7Kyf0Dylyi+TBA==
X-Gm-Gg: ASbGncsScEvR+0kYCd+IEaA/ACzT/Rc7ZrhOv5F8NgGVAXxt01FU+Ybn312BT8TCuzP
	jbEQANBKFfq8Ww2FBbANoHWflUiu82170fBND2OPZ2ZSqdI9J6uHPi7Tk8hzeKEYdGuroN2BWs7
	ZdxJd/kGZYlg1HFEvMmiSupICC5K+nS36RobgxNEDFBOKUjWmcbKMI
X-Google-Smtp-Source: AGHT+IFLz3Vl5G1STkCpTHnFizE3p8mAf9pvpCYG1N2QfqDuoM9RrsfGR/H2ltgphKQYCTDpc5ZM+HFUSOw07SlczgM=
X-Received: by 2002:a05:690c:8e0d:b0:70e:7503:1181 with SMTP id
 00721157ae682-7117543370amr238070227b3.18.1750300683598; Wed, 18 Jun 2025
 19:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-5-guodong@riscstar.com>
 <aFEFBss3RT7NbQkV@vaman>
In-Reply-To: <aFEFBss3RT7NbQkV@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:37:52 +0800
X-Gm-Features: AX0GCFusS0Wf6JwTzVWm3sY_lYpO92NDTczE7xfKgCKObXd32EKaOhpP7K8QAJc
Message-ID: <CAH1PCMYL57eEVyx7qy3offcsuKsN23qO73H+YTnffZe4kBxzMA@mail.gmail.com>
Subject: Re: [PATCH 4/8] dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit addressing
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:02=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 11-06-25, 20:57, Guodong Xu wrote:
> > Extend the MMP PDMA driver to support SpacemiT PDMA controllers with
> > 64-bit physical addressing capabilities, as used in the K1 SoC. This
> > change introduces a flexible architecture that maintains compatibility
> > with existing 32-bit Marvell platforms while adding 64-bit support.
> >
> > Key changes:
> > - Add struct mmp_pdma_config to abstract platform-specific behaviors
> > - Implement 64-bit address support through:
> >   * New high address registers (DDADRH, DSADRH, DTADRH)
> >   * DCSR_LPAEEN bit for Long Physical Address Extension mode
> >   * Helper functions for 32/64-bit address handling
> > - Add "spacemit,pdma-1.0" compatible string with associated config
> > - Extend descriptor structure to support 64-bit addresses
> > - Refactor address handling code to be platform-agnostic
> > - Add proper DMA mask configuration for both 32-bit and 64-bit modes
> >
> > The implementation uses a configuration-based approach to keeps all
> > platform-specific code isolated in config structures. It maintains clea=
n
> > separation between 32-bit and 64-bit code paths, provides consistent
> > API for both addressing modes and preserves backward compatibility.
>
> I would ask for this to be split, first to to driver changes for adding
> new ops and then adding new soc support. This way the two changes are
> independent

Hi, Vinod

Thank you for the feedback. I agree with that.
I'll send v2 with this split approach.

-
Guodong

>
> --
> ~Vinod
