Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A06118EFD1;
	Thu, 15 Jan 2026 02:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443959; cv=pass; b=ZO9yCnK8xK1nB6z66rmlOHVuYv4jrbiauWVrL29ljh63Z3lfMR6mFrQcY2QQ9zRe2WOLxXSbf2uBJSu0z0/ods3bwVXknuuEqKK8tn1PzWMlbMRlKlYSBpKKnkJN0incKIEe6YcilGEV4DUGzRNEsQBMrSy2H29RM0dff+UPRYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443959; c=relaxed/simple;
	bh=KjWm5wOna2WpOISnzqb2AoOrQZWydDdpwEHC+FBfdSA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=lzmMZZcM80WDg+StQlsnP3uqX3em32sIydjceTyR4s05wcNJwc58hyvNr0Q9mXJdYjn7asxgXG9JcakZXQ1DcpBMbGpAa5yqfazkFGZyIhckxFmtazzEmMdPDARubweYidqyNbp6y3/EPA/tBcF2XGkL909HfZM0IGBhEWZXyD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Xa1+brfs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Xa1+brfs"
ARC-Seal: i=1; a=rsa-sha256; t=1768443924; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SdLcgS0AKYw1OM2EI9pNozj2r+kFAtlgo6Uqeb5bGJak3M13Xbjtt9GAIv8taXGsvwD9hqRZCQtrJn/kD9n2rLrqUe12OgbcWutH1etf4THXoQyKyh8uLqCDFaqFsRHkEPDjuRfjuZB/uXDXVFMdznjgStlfuEFhlXysJuqFgAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768443924; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KjWm5wOna2WpOISnzqb2AoOrQZWydDdpwEHC+FBfdSA=; 
	b=nZRh5JKIGp26Qewfw2ZYTcghWJC1miR80JyBZepVkCLnG+QRvpLmiWLzTik0FxagH7+1O1KUhs6lBVtz2aMdBtwhkCrfwnI+wIx2MYuuPH/zk530wSzSKYNkAn8jT0YiMZk/9NqyVWoZ7ibRmMNwDMYr3Ke120MuabO06E/b+hQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768443924;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=KjWm5wOna2WpOISnzqb2AoOrQZWydDdpwEHC+FBfdSA=;
	b=Xa1+brfskQG59Bvab67yVX4GtVvPUI0BEyPcgTJ4qigru7KoXIDh5HNrGjnzwZpA
	O5KGuVymC/ztAQgtajaoGgLs3D+qQiN7PkoiKYuoGZczMbwWmMMwlp5qfmM9MtryEyF
	/NQdagYfzoJLhUNrTY43Irjd02Q6/ErceX1uUuto=
Received: by mx.zohomail.com with SMTPS id 1768443921940306.07558282338914;
	Wed, 14 Jan 2026 18:25:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 10:25:09 +0800
Message-Id: <DFOT1OLHTY6Q.1TKU3R1DDM5SR@pigmoral.tech>
Subject: Re: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA
 extension
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Guodong Xu" <guodong@riscstar.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Conor Dooley" <conor.dooley@microchip.com>, "Conor Dooley"
 <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Chen Wang" <unicorn_wang@outlook.com>, "Inochi
 Amaoto" <inochiama@gmail.com>, "Yixun Lan" <dlan@gentoo.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: "Junhui Liu" <junhui.liu@pigmoral.tech>, <linux-doc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>,
 <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
 <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
X-ZohoMailClient: External

Hi Guodong,

On Thu Jan 15, 2026 at 7:18 AM CST, Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
>
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
>
> Update dr1v90.dtsi to conform to this rule. Line balancing is performed
> to improve readability.
>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Junhui Liu <junhui.liu@pigmoral.tech>

--=20
Best regards,
Junhui Liu

