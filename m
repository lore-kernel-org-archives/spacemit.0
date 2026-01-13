Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67810277C9D
	for <spacemit@lists.linux.dev>; Tue, 13 Jan 2026 02:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272703; cv=none; b=nHIViFlcTZUUdlbAqPwqNrPrY+3a5EngbkqMVv6STzGOTWcSubs65xMeslCGbyfdDTUctcXayUfnRCde1HGIrnTR6ZePGVaNuZWuwzkBcGewAMNGQO3cvjCCob2Q+5EmIGbdZAag5TagM72j/3JR1RBXX6sc+wwPKgeFnbhpubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272703; c=relaxed/simple;
	bh=ucRpV6w0bt2B3mlFHkbnKhNVeKaPi5p4NBMvpLeeRI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ06VbGx8FEkPUBnOxUq2QywlIqGFnxjrYELMnf3rpDsLVg16PF/mpdK4Tgii+0jogBkyPwbOGUZTbhFDdjhnjfxDVbUVUK6El3PHGHrLuFbJwxnnAD/7VWZ7mans4obUWkdJnF4z1rGk0T0xLro+EHxLaN7kfexk3Gh99Ru6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xGobvLZA; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xGobvLZA"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640e065991dso6452777d50.3
        for <spacemit@lists.linux.dev>; Mon, 12 Jan 2026 18:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768272701; x=1768877501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3EDLsI4gmCoGqH3Z2k2GRncDMxWHUvXOn29qxpSYSQ=;
        b=xGobvLZAlE/mukNLVuBfnU1JpgTBK6yaT+DGdVYelqB8+5ErJ8TdzD8vZghAFZlqmu
         ezZaQYp3dNGgxpz701hYE5/QA1WU1o9NNpJcmT+D5W9cqOAgBfufpQPeH8/VE9rm+uFf
         1JbM1wONF2O3VR+Ac1HbZ94QWxWL5BS3WxUroAnjpePT27ffwdrIW8VOpmGMZ8dnTCC3
         HFER9ugxY5rvF/HGGYH139moFRlwIgbFNLwdf4EkOMeDEjh3h50gULxaHdW++qyWweDT
         DUyhOwlud2XWrT+V5cM6FFSZkuAJ2PdcAhyoY8J+QA8SQJgtI4NQs8k1ccdY3qciXf6M
         sU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272701; x=1768877501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A3EDLsI4gmCoGqH3Z2k2GRncDMxWHUvXOn29qxpSYSQ=;
        b=RakKLiqZ0wK3GvsmH8KrQK2DmYpkhcm5zVZpu3x5jLSwpdPK4w7LOrms3NchDR84rX
         hF9CfeZdVUZvWGJ0ABzZ103WJ9sby0/rfwljxSTUvW0UmHkVJJvSLuVBpmMEtys4aQUB
         KxBW/J3ad6ah/mlx7VOU71frWYzCBq0C6/jzPvtwYyUCORARQlfvplMM07QUJm8seiUt
         eZxlgGgP1bHUjNQR1+zbwGEkn+4m0TsvCbTt8rrKBU2eqgIuAFYICHYBahGIDCJmdoTg
         H+hmb4pkTaI6fKTcN2M9d/773ast24PODS954UmnscQ3lVteQfHB3TS9GZsqoDxlYMq5
         eQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo0+zWTYdBdKo3wKMZX53Pni7R/EcIxivz5FyqUUDwyaC2q/zBtkubPtcEFV+mVkTRgceKepKWLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc8JshuLNmjZmOUob2yXD4ULp4bl+c1ZeScWWcI4QvQzoa0+U0
	qra842UTnr3GPFKnjGXyiUZUKpXEKv32UH4UwvvoPefXYnbn4fq/i42ExzU5raZsQZuhtwJsvqa
	l4aN6I+gpUa5DKJQJ7Ho63POdoLv2L+CJZavpqz8o0w==
X-Gm-Gg: AY/fxX68mHecLKN7QSL5L49WDDf7scWOv5W5LGIGzORmpnuEgVzP6YPS6ZYI09YEwXd
	jyJh/q3twEz5cIxPby0TmWk8E2VYCro0nvsypJG2r0MRJwxckuiXzR16hQWR7p7CbcOUQsME736
	h2AHRTck13mPHfsPCkPmnprROWjt8S+1a/7+Z6iRe4qMJecvp/XVzo+Gzf7M8Er7IYjdCetAJk4
	h+g+T/Eg4FxxVe9hBhyuq5tI224TyOe5clvKs6H2/y3JCQeUw5B/rrdQ8n0hSg1G9bTL+bO1HKW
	PmzyyQ4hK4EcXBn/wTv+2oekrX9ZgKg6HhjtNg==
X-Google-Smtp-Source: AGHT+IGY8QkMTn4FKDtsguPkPZlInIEAk3s30SOaRJ7i+o+AsKUMCFEY8+PBpcpdqGZl22WHl4ejg4hQ7dqsombF9rE=
X-Received: by 2002:a05:690e:e8a:b0:641:f5bc:6983 with SMTP id
 956f58d0204a3-64716c2c6eamr15484452d50.79.1768272701490; Mon, 12 Jan 2026
 18:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com> <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
In-Reply-To: <20260112-shrivel-sarcastic-36d9acd2d96a@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 10:51:29 +0800
X-Gm-Features: AZwV_Qh6psUrOlkmdvJ5XMadMeDGqdGdDoMMCEqx-N5Umm_2TBrLFIEtUXleAvI
Message-ID: <CAH1PCMa_rGWJsNiu3dGiOBxF9df-RL6qyanoGde3YqvmfGLyxA@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 5:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Jan 10, 2026 at 01:18:12PM +0800, Guodong Xu wrote:
>
> > Hi, Conor
> >
> > For the binding riscv/extensions.ymal, here's what changed in v3 (no
> > change in v4):
> >
> >  1. Dropped the patch of adding "supm" into extensions.yaml. At the sam=
e
> >     time, I will start another patchset which implements the strategy
> >     outlined by Conor in Link [2] and by Samuel in Link [3].
>
> Okay, that seems reasonable to separate out.
>
> >
> >  2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
> >     6 others. "sha" implies these extensions, and it should be allowed
> >     to be declared independently. Like "a" implies "zaamo" and "zalrsc"=
.
> >
> >  3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
> >      - added the dependency check of "ziccamoa" on "zaamo" or on "a".
> >      - added the dependency check of "za64rs" on "zalrsc" or on "a".
> >      - added the dependency check of "ziccrse" on "zalrsc" or "a".
> >     The commit message of this patch is updated too, to better explain =
the
> >     relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
> >
> >  4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making=
 the
> >     dependency check in both directions, as discussed in [4]. Since "b"
> >     was ratified much later than its component extensions (zba/zbb/zbs)=
,
> >     existing software and kernels expect these explicit strings. This
> >     bidirectional check ensures cores declaring "b" remain compatible
> >     with older software that only recognizes zba/zbb/zbs.
>
> This I asked about in the relevant patch, I would like to know what your
> plan for adding the "b"s is.

Thanks for confirming the above. Yes, I will start a follow up patch to upd=
ate
the dtsi files related to the "b" extension.

Best regards,
Guodong Xu

>
> Spacemit folks, I assume you weren't planning on taking the
> extensions.yaml stuff via your tree? If you weren't, I'll grab it once
> the question about b is answered.
