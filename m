Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31243AB28F
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698940; cv=none; b=IlMNR06ocIDj2ep1aQuaQay9BDWEL5AZ7FLQgr5XN/HKsb/NpF5P7iypv83lPUlCNbI5fi+dz3ipXvkmuv9nftW1v9CzSruH2OvXR906/YDuMUq7933QpOjthaYYucrazrw3cFRbrOxO6S6VLVr8ky8b+Y/bUckKzrxkACWjLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698940; c=relaxed/simple;
	bh=gtQuWTSxUSwTe1rnC1Bxe7ukjpoKqS4f+Z5r70b6Peg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVR1WL8ZJVaetaEWSZkCWPd/luMiDXqVQd3IHX5goIKxsOqNXWPcCDVj5QR6QiiIKioJQ78jkP6ONwdUN9aQi5DJgcLQLi+nrwXssl2tno+LY/OTZnIMBqrFlr/WI1nu6uurHfkHbfCdvmUmc3GK5CIDc9KMXu5UWH7qXekNIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJppW/yd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJppW/yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D751F00A3C
	for <spacemit@lists.linux.dev>; Mon, 25 May 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698938;
	bh=gtQuWTSxUSwTe1rnC1Bxe7ukjpoKqS4f+Z5r70b6Peg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MJppW/ydAq4+aqbVWJ3CYNAA1e8mfTFUs4rHAg+D6tuYfnBbo269TIKSLc78Znv8l
	 XkQ7JF33YPTSl7ljzMih/o8YDPcegQa2AEqrf8JMDeTfwUdWphgP5ksT5C0v2VTSuR
	 2sZYBAjGwanSXsAEZW7FGsJr5BE1nAC8fBpmxkjK+oiURk0jf7ZDIN4q5A/MKHMjmq
	 6EbUgDeH80ir6/+elbZDpIF66HysTHPc3Wd+V1pgE9Ml4t4Vj5NCpoSzIGsyeA3A+n
	 sl+v7do+xzv4lVucgQ7Ww6m0r0eEEdmLT0C6KSOs/r0htGp0U8mcT3J3YvLp5Lrd3m
	 WP+kmMmLyb1fA==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-479ef2b78f3so8653696b6e.2
        for <spacemit@lists.linux.dev>; Mon, 25 May 2026 01:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9mFYHQLaTUsXOnjJmacwbdnQyhw9o0rrZ8O+02OVeoHJzr9NkL8o9kdV3v9WaInM4fYEFfcBIAkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfQIrGOd33dSFEGmgsXN+QtpGPH5aI3eX9MSjHfwOkjcng3PDJ
	O9g4PkkhXSMgLon2wMWsqHnGK86LxNbGELKTpqW372+ub6Hf9eegiV5D6knBIxRoHjK1H4HNMzk
	b3vA0Wv1hZpTehQTWZWy735bBHx7+498=
X-Received: by 2002:a05:6808:4fe6:b0:462:aa0f:4375 with SMTP id
 5614622812f47-4854a3afb48mr8047575b6e.39.1779698938186; Mon, 25 May 2026
 01:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn> <20260519232154-GKA3708537@kernel.org>
In-Reply-To: <20260519232154-GKA3708537@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:48:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
X-Gm-Features: AVHnY4LjkE1u72Fg4ldi4cz_SRmret8T9tX1fPLbCSOaUNt9lHK5p1Z2W56miXY
Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Yixun Lan <dlan@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, 
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, Anand Moon <linux.amoon@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 1:21=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:

> Can you take this as a fix for v7.1 cycle?

Only if you can provide proof that it is a regression, i.e crashes
systems that were working with v7.0.

Yours,
Linus Walleij
