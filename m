Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01881D6187
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765937184; cv=none; b=SFThZs1B//APXJO/7/5Kx94S2KOLMkAA28PKqZLsJ0MzkdAyqO/VUu9QaawU1/i3/EtHE8P/LifJxov+TUaYlVgj58UUrFGycaPMVjYV9ReeSy9P6MHX9ck/pXW8QznZGFF0jXAxFVjt8geWH0zyW/56f3VOlC0J9g7DPUI+0Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765937184; c=relaxed/simple;
	bh=6D/RvGr+Byo9QF6bP9/bKjr88t5+qZCl7V0ljTkIQxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VK5btNEgxrVc+rL6+aC+mL54Vu3+8xJ4Kb9/KpR8Duuca/VRLB4FJqU+tOvuyromWlBH+VR9WtegrY/Cd7ZtVF6QeeynXA33sjR+DXQu4Ldf9bfNfaIng3Zf13LgI26qwAZx2PJj9iXIIqpvaC0vvkPAB7uMZmC0bVpS6SvlZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZUWFJlVc; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZUWFJlVc"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-641e9422473so4305074d50.2
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 18:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765937181; x=1766541981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OfiOZIpxg0tDEyK2KQTYkmCtCk2RA8OzRoQCSq29r0=;
        b=ZUWFJlVcG5aZD7JwfiUWMgtF/TkNI1hIWz3tSIlMwYhOYXEiqMwODDlYgkXjOsHGIo
         5n0yJKBnAX+B4CHiH31rp0RI5ppwJN/1FJf70qYcxRboGOBo3U/PlMYeCl0IHSqJfkIH
         UaTSL6lENoUnhtHd4u3PQtgdWcUGphduMhBL19TWeHXM6B6rNwfci5QYu7OLEhrAkGMs
         t6Ng3JUPqpJHLqFlAIlZzGTaj+hpDXniTlxyOFxmufEjxpyFZSNzACcsw1LrioETMZEE
         o1aaEsf0/USXVQlJHlb2fcaBoLCFOodPNVzo6tQWy2N7PHNMCbdCY46T5X1Jwhxm9p3o
         c43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765937181; x=1766541981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OfiOZIpxg0tDEyK2KQTYkmCtCk2RA8OzRoQCSq29r0=;
        b=w9WBVNeUs3QIs+EnTHc8+w9/mT9Ge9hPJgRQsGh+dX6MaJXoUCP8Frek7aU/1UzPcY
         cQFuTz9Viogg7GEdc70vSWZIXrdnoV0NborlhmE6iVFlQr3Zndw4WptMIcdFbq8cyCVR
         LhfelfdT1wF0JqHku+G3u1Bt7PexH4VjVhmiFdUT1LAZqCcCvjxHnfIGL8x7w6F1eP7I
         fc9NoBJ6WieQtoeTmetMyMoP626/xOPeCtBScsyHi+KIfrMqqOy5s2HpeSl72ydO5Tmi
         BTLY/OFF6XuvrHDrVAyGHOT1Nx6KAfJCUNGP8ll2MbbFZKjj3/m2ystCr/joA0XU4V0L
         +xpg==
X-Forwarded-Encrypted: i=1; AJvYcCXvVvOQNK3WJLkJTPyV2+Co6L3tFHa2Z0lK4ufj69MSTe32Ve6GpogbzS5orPpIyzU+lUFmL8rviQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNNxjafMcSLdog9jj/H8CeKzAjPCGL+JnAVxWazCFu4FGRLFLw
	7P1Q3AC64d97vDAghyWDHMqLfQzV2v5LOBi26luyT5dZMjXrVidqA7Op1OOAX7MHCJkp2ErSAqM
	xd+qebgYZX9yBGIAtMUaNfogekuCr5l49fPxs8iG/PA==
X-Gm-Gg: AY/fxX6UDUuA20EIL0eWXc5dOfKhkat+UBWRCL4Yi5TPnfHl6rKD2+7l8MMQ4p8Zkz/
	+Tmw/NIkXxlgFYI2IW1X+w5WBrDIxtC8mC+CzrlESQK5wOCuMgih/lbAgywZJunRUn5b9YZvWkM
	NGXoip+5y6dbCvQsOQGNJCmEY8JrX24WBSod94Rk1McRd0A7KehglxrDOXklf50ZC22+B+ozYxw
	v1cufY3+ZEAnVAR2y/hcW0Xp4INsmZvNiJcmSOEkjurjwphvcGlGWV6QFfccnLXHG+kof7Qk9f+
	F/8sCfXs4ZpXAiPYPC+KV7WevjkNenvWqTixR+h+HF1U
X-Google-Smtp-Source: AGHT+IFjkXFLSpb32ATeMly6o52Ldy94ZE2+rmmrjPmVwuAfzYm/nWP3oN74EKDLdVk0KisKe/00zmf/rjIbLwNuY1U=
X-Received: by 2002:a05:690c:7088:b0:78d:687c:8583 with SMTP id
 00721157ae682-78e66cded17mr282776567b3.20.1765937180750; Tue, 16 Dec 2025
 18:06:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <20251216150748-GYA1937017@gentoo.org>
In-Reply-To: <20251216150748-GYA1937017@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 10:06:09 +0800
X-Gm-Features: AQt7F2qw6wE-Ygw0dsVQyWLoaQf00ZTdNYPMUaVd6F0gE6fbGRiPsUhouMY1MOc
Message-ID: <CAH1PCMYQhDf9eNRQYTaL3KjBCUC+ygXFKTOVqULdp0UNAM=wXA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 11:07=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong,
>
> On 21:32 Tue 16 Dec     , Guodong Xu wrote:
> > Add compatible string for the SpacemiT X100 (RVA23 compliant) core.
> >
> > Link: https://www.spacemit.com/en/spacemit-x100-core/
> >
> no blank line here

I will fix that.

> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
>
> with that fixed
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

Thanks Yixun.

>
> --
> Yixun Lan (dlan)
