Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFE3321B8
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051385; cv=none; b=UlJjG/iolAUS3vLIO3Rx396WNa3IDPdxgsEJ6gEeOavTI0xbSDQzyszVwhxx3SLxLc7z0cqvckfWfXNe6HfLbaZMmIaidMxHyPgD504pGKK2JnBLpnE7XMfDNUlOdsn7oro2iA6dxg/LwuWLEpik4aoYZgxsCXgdl+zCtixRMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051385; c=relaxed/simple;
	bh=fw+scCp3Y2vZkRujVB7JNSgtOVx2kT1RXTg6pYLQj1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGF167NDpXn6II67h+KE7GmQ0sz88/RsIEPqiIEPHbkoHe4GGpO9Ib5wGxiRXEBbxLiMi5xIZxhwAXIw/UsjuT+wdZh3DdBLmm6jTfKrAuGxJ9wyMTiSLTNpfSgQaCO0bP7JNCZazrQM6o01wlpCufbywl86+T6otT3aDS7J+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2MoiQlk; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2MoiQlk"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64472121ad5so341951d50.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 01:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766051380; x=1766656180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHsxKeDBVPihRIP+vDNg1CWrDyKdjDxz6zbw/6Q71KU=;
        b=e2MoiQlk9NRvvg183fLMWrnWdpeK9nvl/Jqurtl6SxO9mVRwIAVmBD7SZidae8rPXs
         CUc7f2S6PjmeCo++nFMJ1v43rP6hX5Q7Eqeqg22+L1YFhlRC4XBJfRZgV8PnP0a0lxgL
         vtg5WTiGRBsWn08+ya3/Lj2TTKOIJgs4JUIoQZ8FWXLYYqMRiTniR1LqxtgDb5RyCcaG
         FKQer7xV/OkDsgjtEU5KIQYuuS3ubcjuglcDGTvx451cfkURPrNQqkrxcs+1nmzpUBOq
         Y4pCBuEJtQ3ZVy7GI5LrWEadNT0Pza9fLkIEz2FjmoM38cxsMElidhlAuzCD4REKrxdc
         cMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766051380; x=1766656180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHsxKeDBVPihRIP+vDNg1CWrDyKdjDxz6zbw/6Q71KU=;
        b=Qs2H45iXxnQqARDFFI9g2x27Lhfun9G5lFWeilHmA+L85pOxk2ocC+Jpx6RAmh2WBZ
         6XqvXHjD7I87uKaZOz20pl+t0V1K/WHvUOasnkQUBpuGzTkB0xqSBQCYeQ7mr4iAC9Vk
         kju8dMhGJgrTzxKjJfgp0a0yuuC4O2FY3myzeiBH3NQPaJTR2mSPaTUPHYUE9U7tfUxX
         S7Y84LXabl13ZLokWL6vL5ZCUcI/KUbZi7NN01y+8YPHacicfDMi0PwBAUHbIjQ830MK
         L70MqK26Vxi+GtQWnUkvgE2ViUUSl8hFCNuea8jdx0jEmgIdEgsArX/Py4z5s6HaYegu
         9Yrw==
X-Forwarded-Encrypted: i=1; AJvYcCU3is4BHINbyEVYX1iwY9rA2hTD7T8aVXuDcAuhK7KzdbeGu/qwcQkoPF1KBOj9qFNY0HOaK/n9vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YysRFzm5iNBvxXao1GYid2GH040Hakev3dtP5VQFn1IqFuZNbnF
	1kSZcGHu3Ew0OnGvzTmDGUTXSOhV+KPhM1kmHn79ejSTVbrepZrEr59Demjly63nfVloRKRfOdw
	4Zg5b7Z1OzSm99YXi1UhLGPLgOw/Ob7g=
X-Gm-Gg: AY/fxX5Wxtxt7VKDPgiV7L4fci272uYeHdn1UktkjtNWmxP8Vw0N+lc0tQn/w1Rkj4J
	1a8b3ZQDjS1GRlCNP8dQl8Gi0YOJ73BLwRKSfu0wFc7hEOAqlrMNzWgUn0Z7+UPWcVGAiyCXXwk
	B/JIB94yjmXJHIB6qwaBS170Yc2Ip/TFE0cx39c1RnAwFje3UwylHEfxRGOBSV+mH7eerZdcHYx
	qoAW8lZMrifz6zry1DjSmHspDjoFrcr0dyHDjwbTBN5bRBtD+YVrq59xgZkMQ6oDFxgRA8sFS17
	7pN+7Xs=
X-Google-Smtp-Source: AGHT+IHbUhc8RcoUU6kca2g9DZ+pSXhkgOn8m+QWZSDVhkkDGOALJ9i1+/27LQs8FgtCWbcfrM1TLN5mXcf40yRfWYg=
X-Received: by 2002:a05:690e:400b:b0:63f:a7dc:159e with SMTP id
 956f58d0204a3-645555eb6b6mr15491199d50.29.1766051379541; Thu, 18 Dec 2025
 01:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com> <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com> <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
In-Reply-To: <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 18 Dec 2025 10:49:27 +0100
X-Gm-Features: AQt7F2oIzwxN3_St6jPUNCVlM5yaq4EraMfq-v8ppvY5wcNGS34sZfG_8GdBSlk
Message-ID: <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Johannes Erdfelt <johannes@erdfelt.com>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael, Yao, Javier, Johannes,

Thanks everyone for the great discussion and the guidance.

First of all, I=E2=80=99d like to clarify a point regarding my previous ema=
il
to avoid any confusion: the detailed technical breakdown and pointers
were provided by Yao here in the thread. My mention of Javier was
regarding a separate offline conversation we had earlier. Both
contributions have been essential to understanding why the SD card is
currently failing.

Given that we are all a bit tight on time, I think it would be best to
split the work into separate tasks so we can make progress in
parallel. Based on the feedback, here is the roadmap:

1. Define a separate compatible string: the eMMC slot has a PHY, while
SD/SDIO slots do not. We need to differentiate them to apply the
correct reset logic (skipping PHY init for SD).
2. Extend the pinctrl driver: support is needed for switching the SD
voltage pins from 3.3V to 1.8V.
3. Add tuning logic: this is required at least for SDR modes.

Since I=E2=80=99ll be focusing on the driver/reset logic (1), is there anyo=
ne
else willing to pick up the pinctrl (2) or the tuning (3)?

Looking forward to working together on this.


El jue, 18 dic 2025 a las 6:25, Michael Opdenacker
(<michael.opdenacker@rootcommit.com>) escribi=C3=B3:
>
>
> On 12/18/25 06:19, Michael Opdenacker wrote:
> >
> >  * You won't be embarrassed if you already passed these first two
> > checks ;)
> >  *
>
> I'm the one getting embarrassed =F0=9F=98=85. Copying and pasting from Jo=
plin
> notes into Thunderbird really made my reply ugly...
>
> This made me forget a quite important rule: send the patches to yourself
> first:
> b4 send --reflect
>
> Michael.
>
> --
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
>
