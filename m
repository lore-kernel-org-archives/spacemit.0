Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794597300;
	b=L53ibd+St8b/FnGzJ7F3axVdK39DxlqHfHnMYixAaivHTFfYy99EEWhLyY1I6j0Qrvd+
	 +Uec4lVKyMLVauGLjxb0vBKTyXzbPn1+2jQrfYlTyxGLnqggIyp3sRd45Mb7ZfOjiMv4Z
	 XFnVmzX1BkLS8k50qvan+friv0XGrFx/vcsGgR8JxJVz07Q/fkF/WDA4jmMUjZQRbbmtK
	 LVlYncxQGu32ZNMPk1qLR8IyOgA7mqyvdzTT0Vtaq/X5JbZ/LKIiHfQ+xPo2Y89VVBwS3
	 h47QU1RJgm4ozc4XWJipeiuMmQ6RJhfyyxscmDmZ1qKEt6pOa17RhVnt5qE062ZTaag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
	b=OoQaIytwg+6IkSD5UTzStC70gMnL21nAEBEECveU7yzv7klJ8WNLb+IApzoiXNwyqC4P
	 4DI7FILrq7qoYWfoc6hb5D3OaienhzFdImSgpcyN/zTJ+0RKTjpLo6wkXD2kuDpA7iPUn
	 eWx6k6zlIEjBbk9xzSiKjcnzWiCN2v5dgfkD+9e/1RRPgqFM11258OiTGna7sO1O5aDII
	 x8vezla6mpIMcVVUGfAgcnaElABgIxe7e+e33ixjlR8xCRBnUpda8+2DKTMJ2//0K4WnA
	 OZ72BxniJijVR6pFOU4DhA2VwXIDjcl703VZyyWU1HlVzoZYmf9ZISzT/fJ2ACyi58w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zh8T4H10;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB4606A337
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 19:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DB4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zh8T4H10
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6798af41644so1011576d50.2
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 11:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794597299; cv=none;
        d=google.com; s=arc-20260327;
        b=pD2YzUkZeHGe01LYKfSWYkPQ+XwDt7rdOb/IjAM8kiYosnnWup97lUDOdKd6yKiDKJ
         SSJpdtlA3oftrlI+EW7WNUKxNaDeRkhWMXVEHMOBuGzt4dSxzMs3Snc462qm9ofW5S70
         QRSXFY6z9XcD4a0FBs8/y5FOSvKj+dKHq/OPRpazR93S5NCVtE8XoaF5iIHCiB1Ki21n
         dbJx8E5y87XlZwHMJwfsrnc9sq+NwcFmLaZXLuXX4Doqhc+uJgz61iHeh9g6/3r/pMEQ
         vhmbdiOZb+Fx67ANh5d0895O8+CG1xU82Dserad/4EIDfsDo3Tw27pC+dfiZkra0mMl8
         9fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        fh=O2A6osRlx2ThvdcwYA2UbEkRS+hffzLX1BPYixNaGsQ=;
        b=YeQYCVX//5qPyhaGghDRcdu/Ppw0Y9IPjC+qIP/OaShUH+1rC0c2SoyhLmJXbp97Qk
         nG5K2dTo4cOkDQtFqSmyzDsapFlvDpnr3/p3IBjiOy6PQrnKKMzUHPK6rjhwEpCWzHnS
         1ixJPLt9miTPiufRQFfZlSDlLyQP88uDW8O0dxRIwASXDOVUzN2xCE1MsImUjkbZBISQ
         T62OxQLa4v0mgMzIke2hcyY7gsEuG6grKJCUBuhd27ksvvMsgj6gq408ERi/Rb9+6gZk
         +O0yy/+0tYrn7l9Gah0r8lHprwGg4KmYn0mIBlQudYDvOF2xbvTrKvTzJrGdIa9Vmuga
         QnHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794597299; x=1795202099; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=zh8T4H10y/ujRYieyMKVnqe1KmaULzUCDyS70Xg6MvaVGSvq2WEVk4p1CILcPYIXwd
         iG3bZzb51LUBwJUpBuFRr/OeOHd7vRL1RF9pqqrqQ7GGT5Sir30qlva51RFBx0oTtZh1
         eYiBbNKt80i/AuJuTbyrC6GcOQKqBoMG3MEi8n7Bl8iRXBoVNeMRoAOPOccYBKnCAEYF
         GRNf4BtjfVD4+R8+ZEf6oGupfzvuUjnFejHQ+7zDN7MX8W/nrF19s1cdoM2pO+gThCdQ
         mjceCajN4ppCuSSJrd7PuAh9oBbu0h3GKRqsYJjiQnUEPUy1cUFK/Q/MPdj4C9jfjJbH
         94MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597299; x=1795202099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Lkji1HX8R+QyAlAik1p8btRedCNisoSjayriZIZjc=;
        b=DgprwiJY5363xplJTpMv7Bo/M8m0fiL7sxNo2dpwZUkXF3DvCgmYE6qAFj8cYsb/kA
         bgOivUzM7bPzNn4CEybpDvOUxC396PHCNhONgQGAu6wa/0fuurR3Fymrv1XXFkAXB7wq
         nhjTNQsrmvmastIWSylhTmngs8ZEZIOwJZ1oY/amN5bFTxUocqVDN0wpHP+ssYySkAH3
         uDcrYOSRgSdH4aqF5Kewyl5ZnAstLNXZ4yGZrYokWRn9iGuW0Lm6Icq5V/kWxwk1YIfg
         OiFHp0EklIA3Iec1BByMEu2wFZQ+Ma8rjMXAm+o6EuIH3wafsv5HyasR86XexQLqAvLL
         Cb+A==
X-Forwarded-Encrypted: i=1; AL+hErEgYnaw5W0TXEXY1Mq0T91Ik8/KC2re6al00OjeY0wZ8MRkRTe9Fo6HOHfX6UrdAUVnjcGO8ThPkw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0ZyNxfKM1Mx9t5kzudjGTW8/XKfG9PBIZYNq2jomMggwmogO9
	CeUC10YgyaG9gTvYZbxPo2U4FIiCjJpdY2mZs0jJuRLITkBl1td18ecdp/2qvoTCZ0oBBChruyA
	Y03bSaA1R7fB4NgFlPdwLCF65DzUlsCs=
X-Gm-Gg: AYBFou0tHG6747N7qOaY1B82QRY13Jb2mmMHQG7DrPd/S7Hb3cfrCtLLL0Nb/o28MzX
	vzgPxdQ/TmOeEHEuvLNfByoDoqb7djObydLLh4t11cAQEp5unxvNTlMhTSo5g3QJZWGps8SCDTE
	MqROXweJNxgpq9PhMfLXiMUF41i0rcqZuYlBIAnwnoE4Qh10/Jsv7IPjFnlZNgTcNAIEVzFOXjS
	NfYQppp+ag7LXEXw2QWrUxVbdM6TDA1BD49pCGQG0zJvCw9Z5Bi/XLI/UL1QBaNYBrVhIqFGkU3
	tY3cEen+dGuuIIEbGAUaRqqQfaNSVSvmqcCShRt86WmCOM4a2aXe3veuTUuMI9c5xK+h8W2d4wB
	+nZIx/njxHj8cKUWSFBDQ++rIrCTIBS0Ip3xTrg==
X-Received: by 2002:a05:690e:1188:b0:67d:98b7:8861 with SMTP id
 956f58d0204a3-67d98b79810mr345876d50.48.1794597299405; Fri, 13 Nov 2026
 11:14:59 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
 <20261015-orangepi-gpu-v1-1-03566a615660@gmail.com> <20261111004732-GKB2005@kernel.org>
In-Reply-To: <20261111004732-GKB2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Nov 2026 20:13:00 +0100
X-Gm-Features: AclHuK_kboH0z5fWoPol696e94WfTnxywiDJDP5pOyMB6ipnYxJpzrLU0NPVDpw
Message-ID: <CABdCQ=MPPuTQ-3aCds7F6C1AZ2c79HVJXGjtqN9_jHpKo+0E2w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: Yixun Lan <dlan@kernel.org>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

El mi=C3=A9, 11 nov 2026 a las 1:47, Yixun Lan (<dlan@kernel.org>) escribi=
=C3=B3:
>
> Hi Iker,
>
> You could drop "RFC" prefix next time..
>
> This patch generally looks good, while note that it has to
> wait for power domain to be kicked in

That makes perfect sense, I already noted it in the cover letter and
I'm fine waiting until that one is merged.

>
> On 20:56 Thu 15 Oct     , Iker Pedrosa wrote:
> [...]
> > Disabled by default; boards enable it individually.
> >
> As GPU is integrated within SoC, I'd rather see it enabled by default,
> so will not only one specific board befenit from this patch,
> besides, I see no reason why people should disable it by default?

This is one of the reasons I sent it with the RFC tag since I didn't
know how to proceed. I'll make sure to enable it by default in the
next version.
