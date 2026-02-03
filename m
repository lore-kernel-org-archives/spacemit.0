Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44B4364EA6
	for <spacemit@lists.linux.dev>; Tue,  3 Feb 2026 18:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142964; cv=pass; b=rXleA4vBebGmSq02QHjSIa3HfZboJU1hmFvH5x8uxpRQA/TvR7kwL8D5lVOdaHsMvGINqLDr3uBp5DyC2Xnb30n4uGP9vT5RHXAqDIxcDRqnEGgS8ZVpXAt5s5fXchzjwCsvuAD/Z7yHqyPfmRJb5CBnMrTMM9Gj/igB6IVWTJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142964; c=relaxed/simple;
	bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndqm+w4FVwjTkzL7bZyv+P5xYQnEBscq3PuxWlgHfsApCDRZvMaxN0iVhbwrWrs1kDDSj68ILVMMS1UwKoAZBXbpTUAHr9a6niDoGZafOirfnaoOQW7mLTqzJL49YP3k6uxdp58luqkMfqVKg7cX5u0UuCCD7YSkkfBqiXohGgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGhNmB9i; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGhNmB9i"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-794c2db2ee5so33801927b3.2
        for <spacemit@lists.linux.dev>; Tue, 03 Feb 2026 10:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770142962; cv=none;
        d=google.com; s=arc-20240605;
        b=b5336JObwLra+T+xnUzN/jY/XgbVUL7xkUFHc0VlhdBBDzBvoZ/Z4kOrrJqE0ceTp5
         H4RR0mQNVawBECRBRMvmm0OexBoWuCVMcEVIqOxi65i/ImXyhPFdsWSp6C8oI4THYMsn
         WOSRmDac7YamMbmTW1mqdrSaxjxjn70cdwN0xUDkN2ZfOYjgpGlshy+wMRNHDixXTLnH
         aI5+ZJEw1jO925uDOg5s80de/eaSZC+eWjVo/PE94i1AV2I3bGnBSNytl9DRzD5yW96F
         6XDsG8EnrzK06sK/BZi6qLkaUm6QXqZl0qe2TvzD8jN5i+1jzbrifTYFSrAWtTgA8Fbu
         olHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        fh=d95RJelKaZ6cafAtCrEKxV68VL0MA/mfnz4UNgK4iTw=;
        b=F0x5yNaXqhucH3NkyeVCkiaj0c3OHvWE3TTx4wMXAPiEc5nSFc5XrOwEcwKy7GbOTj
         AH0uQWAN5hLZByyvdWl2xpXM5nA8lQCgZ8HTcAcOQ8u1CYHoCxRjtH40zSKLKG/BBaD8
         GcrRlRjBSenvCWnZbUOAD+Wj4RFBPHnoBVa8lNTlH3TKq4XRaO0AQ2yXIsyEpI3KmfYl
         /heqtDkvX81WP+65fXa7PhR14WeQxLCxyXzV6Oohqkd/J5ulYPMuv5P4h0/eLm7qfspq
         OK4Lm7GZthDZbtPfrK7MGOSsCBD6QB/9g5aFvJhH1eVBjG+hkb9gX2z88rnEXLVcqwr7
         m7hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770142962; x=1770747762; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        b=aGhNmB9iNHyxpSSSmUbkMqxj3ocRbvwyIAfBkhzT69Gy7nXLQtwccnJ2dIQhpskLSi
         qnsc012HIezPY5k0bOW4pF4U7RlAO2NFhiy8Z8b3GtYBvlBmUVS15yvlVGaKApjdFb9L
         djdowS2Is2DoOi1P532FEJjeLeaKcDTboUeAIbEa+EC4tYToId0K0pjZCXF8lBy4yydX
         2YEb9zdcL0CBVgezlkS66k08SRYtjqD6CcWkgBVMH/jtQLLC/oD+k0Qhzwhd/POLdQ0v
         nvHv5/YEbRDR/Jk4TXo4R9yjgYTzZXTOqIDuz27+5By5hlA7MOEBzyN0dIXjkL566Dmg
         Ba3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142962; x=1770747762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=72IAYlfThYiEG2aFjGCNshtysLaZbuOWDG3tEGy1mzE=;
        b=LOBogpOJAcwv6EImseY8Un4l5xRHPF5CvunZONsASIfcfc1zhYLuv/9G2B6unypxdx
         +AAw/3thVN0Owj2FGeI0gmr/ra3J42SqpycHO+j8KTs8lLMFwCbWK1JEIRBGn83KLh0C
         WyVlvQchqfSliKnxPC7oGjdm9ja6KSqO5jfpNtvZfg1HJ/uOY9PLulUIh8RMiQA66VIz
         k9mot7bB6CT92n3y39xHA0s3k9/FY35vIfBD1vIwxHhgD6Nw3GgQvZU2yMy2yIDxepPI
         LJuKzXJYPhE/T21EhZ2oDdwNV9DznMqgaJgmMUSWLIEIwmB/Xo8Tq13Z/S6US6Zqcvn2
         CFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI9rW+N9yQiOemk56xrihg8iOlK3BcmnFLjLsEthzxv/uhssgAKmwONfkk0+lv4JMsUHlMoI9O6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YypakuGigOmizz1MRfxi/ezVI8TrpHQNNnjY9Z+e9Zn+JiFOm6F
	S8U+nyqJJEKmpgIPciAeLe9Vkfy6zWWNxFJMOd7QPXVBCUUrSCf82OslPF7o+V69saR30eo3X7M
	4ao+vTOvnntJ9aB1uH5U6wqRxn79RvQ==
X-Gm-Gg: AZuq6aJcFAwk15f5+re1IsN+71YYqZaCK2HlN39EqaGRvxj7SQEFSxCmsjvtWzMyj03
	KXyZiQxFWMKGYJ1IFGisQvNiuM+K5ruFScACZy+kPCavzZ/q/B6dlj3DRF89nf+1pAM2wiPoR1t
	UKZdzNgPb48cklmPZjH+r9gqYPPT4BezWFFB0aQWJOsjL/+DkRqMWKsdeosxdLdMgNKYuhwFgkh
	kmyV1sjeYmqJ7FU4/uwqYy8zCceb/ffIYeM3FNeXIZwQn1bERhWXRt4TnZhlSZZD6wkKlkhd68d
	9rXm75SMlYLLMCxY3C9x5g==
X-Received: by 2002:a05:690c:39b:b0:794:fe8f:ad8b with SMTP id
 00721157ae682-794fe8fae16mr4373667b3.29.1770142961756; Tue, 03 Feb 2026
 10:22:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130102301.477514-1-tmshlvck@gmail.com> <4819ec3b-23b4-447b-b10b-0bd93a40dc5a@kernel.org>
In-Reply-To: <4819ec3b-23b4-447b-b10b-0bd93a40dc5a@kernel.org>
From: Tomas Hlavacek <tmshlvck@gmail.com>
Date: Tue, 3 Feb 2026 19:22:30 +0100
X-Gm-Features: AZwV_QheORJ8ICtVU_dJsf5jOCxuVCH5tMEhwxpjksgwa5Kxeq4aCWYRoHfnm_I
Message-ID: <CAEB7QLBE8OQtvasbDvaeCownALqMcavA2TWOQJG0Sx3Q_-KShw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support:
 manual merge
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org, wangruikang@iscas.ac.cn, 
	stable@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Matthieu,

On Tue, Feb 3, 2026 at 10:39=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
[...]
> The conflict has been resolved on our side [1] and the resolution we
> suggest is attached to this email. Please report any issues linked to
> this conflict resolution as it might be used by others. If you worked on
> the mentioned patches, don't hesitate to ACK this conflict resolution.

It looks good to me. Thank you!

Tomas
