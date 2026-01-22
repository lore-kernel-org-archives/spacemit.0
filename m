Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155763D349E
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769119773; cv=none; b=g7WBpBIiDEEsI0IBHLvurKtsjmfSxs6dXprh/xCy0E+3vOV2eWAvpQ8qlYQbCHHQMd6eeve5CXxCDNEWJKDfn2MQ55eLBYTNZgMPhdn+L0kjlecdq4Z3lG470in3esmLOF4KvV1OEdNuR1VBxWyQ0oy1pLuESYlyX3A8sxMUcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769119773; c=relaxed/simple;
	bh=HPY1tNdFe79iOk8YjZfoajJADGJa3IUibRiQibIAAwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmoAcccV11c/RjJu1nQN3nIbd1bKbk0f2+nq+3Ie3HPU5S9W0iDewf1qR2wt6f51oPHKfQhR6vniwoWBRvJDHbl+UVp5oMO4bW/UYPopwH8kJUOGVbKe4D6IW4C4FhU/Zgu3QIewedssmvyk1njSQBdJh+3D6moaG/xWAaE5wCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 33B77340F21;
	Thu, 22 Jan 2026 22:09:22 +0000 (UTC)
Date: Fri, 23 Jan 2026 06:09:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122220918-GYA69249@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
 <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>

Hi Guodong,

On 22:55 Thu 22 Jan     , Guodong Xu wrote:
> On Thu, Jan 22, 2026 at 8:12 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Mark,
> >
> > On 11:27 Thu 22 Jan     , Mark Brown wrote:
> > > On Thu, Jan 22, 2026 at 06:11:22PM +0800, Yixun Lan wrote:
> > > > On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> > >
> > > > > Patch 1, n_voltages is corrected to match hardware register widths, as the
> > > > > previous values prevented regulators from reaching higher operational
> > > > > voltages (e.g., 3.3V on LDOs).
> > >
> > > > This patch bring system-wide change that not only affect Bananapi F3..
> > >
> > > > Please also provide fix for other boards, I think you may not be able
> > > > to test all boards, but make sure the patches are available, so people
> > > > who interested can test, P.S I can help on milkv jupiter board
> > >
> > > Patch 1 looks like it should be OK as is?
> > then with patch 3, and for other boards (milkv jupiter), should have similar
> > DT fix as patch 4..
> 
> There is no "spacemit,p1" node in other k1 boards (milkv jupiter).
> 
yes, there is one which accepted during this merge window, and will show up
in v6.20, please check spacemit tree [1] or [2]

Link: https://github.com/spacemit-com/linux/tree/k1/dt-for-next [1]
Link: https://lore.kernel.org/r/176618016976.76638.11221127377007758575.b4-ty@gentoo.org [2]

-- 
Yixun Lan (dlan)
