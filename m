Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0A2868B5;
	Thu, 30 Apr 2026 02:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515301; cv=none; b=htQET6z6Li/V43OVfCUbuNKTIh/8gRBlzSoNZOwPQmAdgt2JbCMj430YICYzHdI8B+PpM8ZSJnBDUXPa5IGadvP/bSLzv4J1YpreyFKSAi+vSSMVMPkPloDFCK0esNQxJu7hxaR8fqLWrfBcV/0sTJvLF49418xhAg5s9ewftgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515301; c=relaxed/simple;
	bh=P5Bhrot970eF9hSj+tikVxdnNY1yaiHMLkZnS2b4vFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gqXTO4vHGv1en2NuI/SlVvJn1sVEInYRTIZxAsa8ssJLPCKWBeFt1OJYJ75TcNk4ZMSCURSYFxniqRRsqyrzGVJzq002ikXF4vREQ75kMZGg7DNU0SZANE3yqLch3LhX0m+h717j0pI+m6io5H1Lac97Y/JKrKM8qzlofAzRTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvrxLDce; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvrxLDce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA15C19425;
	Thu, 30 Apr 2026 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777515300;
	bh=P5Bhrot970eF9hSj+tikVxdnNY1yaiHMLkZnS2b4vFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvrxLDce1SspYbR9wI7N2GGlTKIMPx1rc/0KxEHpaDaq8RA4iAWA9rtlX6v/HQj1g
	 3N2N5dJivzttUb4xmTBdK33ptaZiJWNT5pP5/ON9zI6zaTx+s3f+CwMvkZyry/Rh2u
	 lH3Y/wGvej5TWn8t40uwmyES3XY7jC6HZEog7JlYBMUsielwn60R92e78fbS2gVZzf
	 eyeCsAMArpwz31wIfSbdNOu07DSPtlLt5KqkssSaK1LuBgl2NMiLMTIp8Vmh+kSgD9
	 JKcHZEq/vHPURMj0WseIntv9MibjWEqaTPZandJJsGBJ2IrCzuaCwTWxjj0C5Pw/7v
	 9LxzVyxlq6c4A==
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Yangyu Chen <cyy@cyyself.name>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
Date: Thu, 30 Apr 2026 02:14:50 +0000
Message-ID: <177751516893.2918908.17754603353748839881.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Apr 2026 14:40:21 +0800, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
> 
> The series is rebased on next-20260420.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
      https://github.com/spacemit-com/linux/commit/a17be027dc5ccd51b99b5bc7b487ba9fbdc554e8
[2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
      https://github.com/spacemit-com/linux/commit/448fedd56cdfa68c2e661b16a8dfc8f3c40a1bcf

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
