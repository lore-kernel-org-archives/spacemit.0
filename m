Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1D26FD84
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286945; cv=none; b=rpwGSXJLR6dOpgz8PQh6DTzgO4PNlZjD6lnVcujywszpeTYvZEWAbaxzTD13IWkfx6dfSXjBY3WKl/U0H43J5avUZ8+tof6buwR6I2qKZ5nvIpUqT/q12QtwTQfctSbNoqJ2ScGbe8Sfo2FP2ZD37/aG2ys/AtkIYQWkxLG14w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286945; c=relaxed/simple;
	bh=Eow5Ov1CemkDdm2MemGZbXyCIXqPK2NntGjWajJ+ijc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svewnlqi+VsdTj++NTbV60hHYrOYz9F7tG8XV8dcaQmYgTQOvx8oygV/MpwN52RZkAzIgxT93yfk+/yNiWWkty6ltNJgBFX6BNIPUo32wnnQTLS7qQLQL+xckeTpb1BxaGOyIj7DK5eUPaPtQHg8LcLZpK3GdRvT/+CJbM1zMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E78B4340F69;
	Fri, 24 Oct 2025 06:22:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	michael.opdenacker@rootcommit.com
Cc: Yixun Lan <dlan@gentoo.org>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/1] Add Ethernet and PDMA support to OrangePi RV2 board
Date: Fri, 24 Oct 2025 14:22:11 +0800
Message-ID: <176128683756.231420.15637681703914919807.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Oct 2025 20:18:30 +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Reusing DTS code from the BananaPi F3 board.
> 
> iperf3 tcp performance results:
> 
> Eth1 client test (iperf3 -c <server-ip>)
> [  5] local 172.24.0.2 port 41914 connected to 172.24.0.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   113 MBytes   946 Mbits/sec    0    378 KBytes
> [  5]   1.00-2.00   sec   112 MBytes   942 Mbits/sec    0    424 KBytes
> [  5]   2.00-3.00   sec   113 MBytes   947 Mbits/sec    0    424 KBytes
> [  5]   3.00-4.00   sec   112 MBytes   939 Mbits/sec    0    445 KBytes
> [  5]   4.00-5.00   sec   112 MBytes   944 Mbits/sec    0    445 KBytes
> [  5]   5.00-6.00   sec   112 MBytes   937 Mbits/sec    0    445 KBytes
> [  5]   6.00-7.00   sec   113 MBytes   944 Mbits/sec    1    445 KBytes
> [  5]   7.00-8.00   sec   112 MBytes   936 Mbits/sec    0    445 KBytes
> [  5]   8.00-9.00   sec   112 MBytes   943 Mbits/sec    0    445 KBytes
> [  5]   9.00-10.01  sec   114 MBytes   944 Mbits/sec    0    445 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.01  sec  1.10 GBytes   942 Mbits/sec    1            sender
> [  5]   0.00-10.02  sec  1.10 GBytes   940 Mbits/sec                  receiver
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
      https://github.com/spacemit-com/linux/commit/9813395078352fed03c88742bd39b9c4a0e40c15

Best regards,
-- 
Yixun Lan

