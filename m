Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED43B27D2;
	Tue,  7 Apr 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579044; cv=none; b=GM2NTPTRJqRy6v/apPpd5bmsYWDXhZcothfm0lXskzOxuE6LELM/IWowcpG/yGl4fyFnzt1UiKWiS633Le6ZgmJMS9g5lkYMBIs2fNz1NBhOaQrzw2YTLD2i9Hllyv00OyVee/Lqs4GO4PoaIz1sf73iaj+/pgZzf95/TO/v2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579044; c=relaxed/simple;
	bh=3FooutZHnN5nxUVqQr8hpPgl/W3i5T61GrZ8VKy5aQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0UYnJDvMBekp5zSp70IcX6A/eAOvmhnTrgvfDwXXKlXj2JCkEhHXNwGHBAiB8NGbVu24R1ZSuuMXpCOO1/pCgskmEs7F4fJbOQtJcsJe5IpRXqv0IsPolHf0rSSxB1/IxzMY2sUnsNlkSevdMM8nZfIp10ynKKIOHr0pRcz6e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZTI9GWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZTI9GWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ECAC116C6;
	Tue,  7 Apr 2026 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579043;
	bh=3FooutZHnN5nxUVqQr8hpPgl/W3i5T61GrZ8VKy5aQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZTI9GWldshgdI8QkQvKAxRlMjHNEPzrlwvkpnnvvACiO20Iz9jSLKY6tS+ajKWV8
	 KjqMjzJOtV7W1VEOqIYS7qpOmKQoZuctvxOnNixmg0PcCwcK0hDhCR7SQzMMn46g5l
	 mv7uZRCnADCP5icOnDxvJ4SxEPLCfASGWoSB/MgUfrffDSHAdp9MdIXYGCfdbtg1Q4
	 gR6Ag2dWOvyB7j64m1KzG5e3KmfStMN5s2/nORbSYnW8Tkkve7cM3Y2DasBsroYN/w
	 lSE0MECiYwv7YbW1l1dwvX29/3CYYgNGFObsQpuXNemJqTS0cdb95trWfYLafqzHH+
	 NnavoWBgBF3zg==
Date: Tue, 7 Apr 2026 17:23:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add
 deepcomputing,fml13v05
Message-ID: <20260407-quickness-ambition-a46682716b22@spud>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
 <20260407055707.1202730-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TugsYhRd/uE/+Zd+"
Content-Disposition: inline
In-Reply-To: <20260407055707.1202730-1-sandie.cao@deepcomputing.io>


--TugsYhRd/uE/+Zd+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TugsYhRd/uE/+Zd+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUvngAKCRB4tDGHoIJi
0lj6AQDmNDP5TJttVM5GF6cCVSC0t6ifz0ZUtRfCmxJfyIrs4gD7BwQBkCshF4is
4kqBK1o6NWM6fTkIA5MQo6KETdJhBw0=
=pV5I
-----END PGP SIGNATURE-----

--TugsYhRd/uE/+Zd+--
