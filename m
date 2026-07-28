Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84036F911;
	Tue, 28 Jul 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238942; cv=none; b=p5cIBS1OSR6EkiRiJjKj2+pIRlEO22zgGRTvHlqM4rk+3SbzTrDs5mlvuttQEa2Qs53zyHDAiRghIbXX3fpbydA9rY8VVjpXrORuWTnt4HsDlNwb2CXon97skFTKuQGRJchUF1b1l839LhL9KWxsBtIBdjblqavSj1uk6p5nwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238942; c=relaxed/simple;
	bh=WC/an44NFngE27jzIaPVO+Nfkfx0jO+33SASGY9CQdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhWX+v50dMo6o/XujvaKtFiJCZm9hH3rzuJ29zoqa2n1sy2AZqDjOi6vu2apJLHkN3+9/2WAUsv3fKQk0gEOU82RbsO/kA1MPqXzAY2VvWfUJcCsOk0m3+AhN3zcUXkhlXm6IvSXUYBn7/qxS3S2ReV825P9t66jN4Un1Ax8sjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbyY84LE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbyY84LE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDD11F000E9;
	Tue, 28 Jul 2026 11:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238940;
	bh=nLL7Bco7XqVGH97lipE5mmHYcS8LVkm4YhvfVQFwzfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hbyY84LEvImMx0MKVZi4XR0RbVHDnnopnxg6ZJHEByTAT/kWAsT8RRyVlLSYJDHmM
	 pyh/GqG4oSHhK8a13Ra66nj26318wZwbJUAEf5uIJ9UgfwNT412NlEjCqNp8raz+ZQ
	 dKqDvQmcHA3qRZtF2aHeUoWJjtGSsftTQTg8rHJcxYpQturESLHZ3oWK7tvgbSmzN/
	 8XLIftSn+SQWCjYrFIU9Y6Oox+z7NcCUWMaCmITrWUJZgvTmtj26yZYkd9+NHyfveK
	 rxFKgUMLRhnFBrv6Kj1aeD/lqx3O/ptE/OaSbgRZFk7W54YUvg3gRvmvLEP/cUIwET
	 oU2KIdI8/gGsA==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
Date: Tue, 28 Jul 2026 11:42:14 +0000
Message-ID: <178523890901.625561.17183698550548051286.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
References: <20260602100000.2402784-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jun 2026 18:00:00 +0800, Chukun Pan wrote:
> Enable the two RTL8125 network controllers and corresponding
> PHYs connected via the PCIe controllers on the OrangePi R2S.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable PCIe on OrangePi R2S
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=31efde747b5e5d2c185e06d872a9ef9b87f505ac

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
