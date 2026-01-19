Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08F28BA83
	for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768866820; cv=none; b=eSndnisTefd2sdpKmsIAZpOhLgYQ2865lrpfjaZPlA/TYbjZ0U81HtsoVne0boJjw+LhwmSnDvI/InP+NW7S3zUc69X77FfEV7N2/BAKCiiy3NyiL5zJzsycYfEd1ZfYsdWfMHHD4eBMohBtKBNOeSNwjC/hnp9AtzjM/tPZ1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768866820; c=relaxed/simple;
	bh=cGakJU4QjXpVKqVk7iTfLklopa5iarhgK0sVfCXw2Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXqamik9FlZl8CENBepHIgrIJIq4snkbcUU2A5YgTbDmySU3CzgKcjpgmeYiNBpUEzQ8zEHHFHz70Na+oLZs3VXJC1TzuwZtfbJCYHSdFfBxeaeUB6NrtBSK5yTEScaXHycGuSF2kv+0rQoz8N73/Vzf7sqplL2TfeBDLELT8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrUlcXsW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrUlcXsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E002C4AF0C
	for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768866820;
	bh=cGakJU4QjXpVKqVk7iTfLklopa5iarhgK0sVfCXw2Zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JrUlcXsWcm3Gep3dMJbs+AmlhGfq4qhDeSk1ypl7KVINik2k7POZsc/6ubyGlAFF3
	 wXvGJ78usnvU6Vs2JHoJWfqsKeRCt6KExuIdYokRSG8FDVupx+u3Mcf5x7LifTEzvq
	 jz9mwLUX6eltjGfef+3JJV+/te/51TYUMhrBi76m7oStoXO7WJEeSIkIGRaOOQStBf
	 9c+PL8npUVgkYCtUliwfFcsAhg/wuhnv/9FPD1Kg8JleEBEuaYqo8KfAE/mRStIFsD
	 2V3M1ZzhJmd0KEylxYM+dQBKLWstjxsFUwJhsZBl+HZYzxQAcmwU/uEMYjsok7pij9
	 tl493tMSjdKKg==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6420c08f886so6262462d50.3
        for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 15:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjmP8mPIoydd6IV9JpMr9NuB74Mlg+EbI5h9wDF0c0OlX8qHqh7EPqV3C2evNhkR8+30mO4izp9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBKEU/6spOV6n9Cg+dEB01Y2uPkNLVfloegPN817A8zsKfG4QQ
	PLhca2z2e1nZZzEXtMpu5oJcTHsylzgWu4J3rf7n6xDal1rdBdDp13CaaFBREfl3vSBPOkUi5Uh
	M+1PAMlWpjcZ3co8lxxy9TO640i2dkJY=
X-Received: by 2002:a05:690e:1685:b0:643:2169:d6d3 with SMTP id
 956f58d0204a3-64917736136mr8776075d50.69.1768866819491; Mon, 19 Jan 2026
 15:53:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 00:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
X-Gm-Features: AZwV_Qh_eDw0c-w4THoUkVrCkuqzPwqyf9Zz69eeTwoO5y4GUJtui-8WqMWvvzs
Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 7:43=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> Change the size of the reg register to 0x1000 to match the hardware.
> This register range covers the IO power domain's register addresses.
>
> The IO power domain registers are protected. In order to access the
> protected IO power domain registers, a valid unlock sequence must be
> performed by writing the required keys to the AIB Secure Access Register
> (ASAR).
>
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property `spacemit,apbc` is added to allow
> the pinctrl driver to access this register.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Acked-by: Linus Walleij <linusw@kernel.org>

I have applied patches 1 & 2 in the series.

Yours,
Linus Walleij
