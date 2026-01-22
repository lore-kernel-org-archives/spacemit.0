Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F4359FAB
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083952; cv=none; b=UWV7YT6cuFDo9TRrBRFg3gDBB2Z2fiH5Zw7k+MSYq0eHATd0dzmYfavKBEUk4JbKG89Je2j3KFgB3LwQG7mxS6OFA+PwiNJ//KNQyTlO89dyAE770st4xyFa8tDRBNYmevXKXUtp1Qv/ScLJ0lrW+jXjq32gb7AeMc+xbf4Q7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083952; c=relaxed/simple;
	bh=xl975AnzSq233tR1SbD0JCFsC/GAwcWY6Hj9IXwm2WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7vPNfO1NZPwCsx25hsJkiwwqeIP2eiEruSp2svmPqVKeABnhsm/TX2EnMG9wom7FmXHMx2HmO9+oRl2Qm4QrAvok2dTaznnIKceSicyRTtizMJim7qUgoI7Ds1CfW30FsSka7mdGIvDd3u2/TQJAnx0BARcr2GvYP29QwvKicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CB565341E8A;
	Thu, 22 Jan 2026 12:12:28 +0000 (UTC)
Date: Thu, 22 Jan 2026 20:12:23 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
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
Message-ID: <20260122121223-GYC63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>

Hi Mark,

On 11:27 Thu 22 Jan     , Mark Brown wrote:
> On Thu, Jan 22, 2026 at 06:11:22PM +0800, Yixun Lan wrote:
> > On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> 
> > > Patch 1, n_voltages is corrected to match hardware register widths, as the
> > > previous values prevented regulators from reaching higher operational
> > > voltages (e.g., 3.3V on LDOs).
> 
> > This patch bring system-wide change that not only affect Bananapi F3..
> 
> > Please also provide fix for other boards, I think you may not be able
> > to test all boards, but make sure the patches are available, so people
> > who interested can test, P.S I can help on milkv jupiter board
> 
> Patch 1 looks like it should be OK as is?
then with patch 3, and for other boards (milkv jupiter), should have similar
DT fix as patch 4..

-- 
Yixun Lan (dlan)
