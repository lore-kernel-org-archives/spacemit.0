Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6CB3F20F6;
	Fri, 15 May 2026 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831322; cv=none; b=ZgBmm+2qsodaArkWsimrLB75cLrj4D6RjBYEVy10ITiMq/wzpjbA41vUllO5hHYy7OYKmjnnhZp4NJOIvajpAweA1DspjU+krUqjJ0omNkkLVUQlwNRRijrSQ9sCADgBJ8z0clTBoQuQnJTA+F52eWnYHMlORfAgqWT1p58V818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831322; c=relaxed/simple;
	bh=GnvF+3lr3/CxAtmxTGYUQTrSwCr7CpNrWr3OTp6aMPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VToXCwyjurRBdhhREyrrzOIOF1g32DOHDAfZhE6QByc44KRfcSQXpPqVKZeMPvkRKLRAQ7lW3TEQtTEOvZF4I+Vob2ye2IxJ1yzW96OCSaEoN0nzDwa18bPB2zFnFM2uBF6IjNTo/NZXW3fRpD1DKpvOI09zaaiQSMU8adWG6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=av5Irmdu; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="av5Irmdu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=a1AVvdVarc8InzAOGW6ry1UU/91SpnKo6fW3luX2//U=; b=av5IrmdufgZCyrkWhuzfjPjqid
	qR2SeBhvG4bLfAHJc0UhihY+pCE+1pudh4/9DxKesByZDb7ddBmSJNuR3MZNMxvpV/sBGIVFh0afh
	MOXd3D8Rc2vh020gjBvhKA+W3ecJgZpuQQFcm1oUPbhIW4i95n4W9yR210YYO9lWCBNeZSwOQ7D8w
	A4ELDN0tLgPGCGDjYggh309d8EmUk3MCH5iDHbAXRWLftmENZh4bXqpdMsT5gU5kqLQ4rgMCVK8aN
	PjSYO1ijgSw7X0354AQZnh+Vxqpkr3YA7JBcmbOg+RN9Cr0G/rapoWhLocjt+vdG/9abXSB99nMQY
	BrM8Ju6Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNnHf-00000008MGS-2RNt;
	Fri, 15 May 2026 09:48:35 +0200
Date: Fri, 15 May 2026 09:48:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: E Shattow <e@freeshell.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Message-ID: <agbP0-OsfQRFJcr0@aurel32.net>
Mail-Followup-To: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026-05-14 23:49, E Shattow wrote:
> On 5/14/26 08:56, Aurelien Jarno wrote:
> > The Milk-V Jupiter board has a connector for an eMMC module. Add an
> > entry for it in the device tree and alias it mmc0. As it is not
> > populated by default, do no mark it as non-removable.
> > 
> 
> The meaning of "non-removable" here is whether it is expected to be
> added and removed during use, requiring to be probed again; not whether
> it is a user configurable module or soldered down part.

Not connecting the eMMC module and larking it as non-removable causes this info
message to appears in the logs:

mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
mmc0: Failed to initialize a non-removable card

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
