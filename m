Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399273DB620
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136375; cv=none; b=f5rdjNEAitTRf90By9oGvw3WIbBq+rw242hAvFHzAW0Y0tK/kFzJNww6TjvGGEY/SfIFToY8GmQ80j0EzuCPFq5P13xQGngtSlVJT+i6+kJEquGI6wCp3C3Bkx0O3HDYEd5cTAyJVLnyuyVOMSPYA2HWSAHg8WDEejqjBirs6Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136375; c=relaxed/simple;
	bh=Us4XF3nUPEaisj/Y0Gp17IE9ik4GTBioKe/dWHAxcxo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 In-Reply-To:References; b=JaEhVXoV2bzl8KSh1oS8m/VJv9lTS8r6/mSLJyfNC3evf4tCcZyGweWEzeNYUE87f8jchf/cqrjDozvYvdlmICUDIda7gV0++PZqC6yUW3dYLPkyihx56+H5Mw5GcWOPivbS1BkOhp2868Unn4mBHht4eRbGWtu6iyI6v0gzvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pon3tzum; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pon3tzum"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785136371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v9EuBJM+CGkBe7LykhWWRzcPi8hSL6aBBXQb9t5Lfo=;
	b=pon3tzumMBs0fyFJqWphbG7Ccx3chQwSYuUJnE2+qJKF4sO1w9humYcCG/OIkiqKLNcvud
	25YY2tgX9l8bv7Jc5TZY0EMPoOmPd5kGJAhyOPMm0Z67feilRNoadPS+/gGk8T27w+ilXS
	I4HLoXjk8IZbZ6JEm784emoGga+cc7M=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:12:45 -0700
Message-Id: <DK9610Z1F0G9.3KQ7JB8NG1HO7@linux.dev>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
In-Reply-To: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
	<k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
	<57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
X-Migadu-Flow: FLOW_OUT

> > > 2. kmalloc() bounce buffer allocation failure on non-coherent systems=
:
> > > For non-coherent hardware, a bounce buffer is still mandatory for
> > > cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
>
> I'm not sure I'm parsing this correctly.  Shouldn't this read "for
> *non*-cache-aligned kmalloc()" ?  Or am I missing the point?

You are right; this should refer to kmalloc() buffers whose
size is not cache-line-aligned. dma_kmalloc_needs_bounce() requests
bouncing only when dma_kmalloc_size_aligned(size) is false for a
non-coherent device and a direction other than DMA_TO_DEVICE. I will
correct both the commit message and the corresponding code comment in the
next revision.

                                            - Troy
