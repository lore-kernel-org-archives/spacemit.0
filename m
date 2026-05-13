Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39437F8C1;
	Wed, 13 May 2026 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658512; cv=none; b=g0gzF/HdDmtIeAAiWtJffenNEqaIQaXAaYXoMEXHupCEIvi+I4HPmKRV7jupAWTs72IFSKkl6yTRNRS91fTHPt+CiBdI0pKN7d4LvPIxJNfjPmp7YhDrh6+D3kxIRntg2n/xifB6MZw9iUzircgVj8QCqMfDp33s69zv6kDZFHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658512; c=relaxed/simple;
	bh=r4IxZmFlVD6+qhE10Ci/nmAv6mfJj/vjrOXEkC9+www=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke4xN7O3W71YXHlY3oB/6YE3vSHNV2O5c44dJpPqzvYfBeTTVWYo5swmtvJZBt6dP1r3eJ4si9BSMjEvKV446m+UABsWlzax9NiCcTpZOa8WGxPrpd27PFF3Le+baC9jyNFaWta4AR4IKxa810B/5oL8LIoH2eraCAPkk5CLgZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT6ISFIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT6ISFIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1816C2BCB7;
	Wed, 13 May 2026 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658512;
	bh=r4IxZmFlVD6+qhE10Ci/nmAv6mfJj/vjrOXEkC9+www=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZT6ISFIzu+Vn4cYjVcrFExPJzjr5uartsU2ffXTYNxfWMkiznJ5VUCp1O7zxV2ujR
	 Q5QrVnMqYVS+Szcv10XqtNkE4eHEW1mlTZo/OfJVHGopvReozaAZ+CzupuXfPODnlW
	 GzqtA4fmyHKa8T1jlzMqoqtiv7sxAx7VX+QVKHP0/0kerfJH3uHLQwTxM4DhPVvKCp
	 meUwbkhFBEUwewBsZVAZ46ekPYnLwUzcuNQSOTYTdvPOMqU2nCJ4+tFXMAIOfwejXO
	 WKm12f1p/rOJjNpQGoaWjrX1Hdg2o/3bVjDCNBjQFPHOCyuwcnQChl6DPaoJsTbq8Q
	 lkvBhA8uK4+nA==
Date: Wed, 13 May 2026 07:48:28 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260513074828-GKB3624092@kernel.org>
References: <20260513071958.29574-1-a.heider@gmail.com>
 <20260513071958.29574-2-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513071958.29574-2-a.heider@gmail.com>

On 09:19 Wed 13 May     , Andre Heider wrote:
> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
got a warning here, commit message should limit to 75 characters..

> for the board's power infrastructure and voltage regulation support.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>

-- 
Yixun Lan (dlan)
